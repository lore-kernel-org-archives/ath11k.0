Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD79ED6ACC3
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 12:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sN4/UYCKwnjX/w6HTtGzxERNvG6yJdCYTg0zaHpcLhc=; b=346jUIeAFK0uTmrXXkvMrc2K87
	hkG6Hq415nLyiHpkS4FCfdYJH8yvWMZtZG8FvqGcK+wXkWUMgmlAeTNU+AfbwwukXBrHwuz9JKp+Z
	W4KxDr2W+W/P872yYRgCNtI/jZRkpcyOt+LOk4zw6+FVw85IXfKnYqSQwWklHSFGNiYqEf8uoRAfg
	WrBerFnp28zrCm6ya6QlzkI1rSbbUlTGjBtu+547ccndjj4Fr9NZjTwW0C7EbcCGbS9mhofmAsycA
	gwfZbXYXP/SD/5HTIdGOkZfhExoikX8IKikK9Tnc6eKj4DiSdhGi30/nSEkhKZSdlpUZsU5YwtFkA
	jqXHSJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGjZ-0000000D4lO-1EBe;
	Wed, 27 Nov 2024 12:01:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGjX-0000000D4kl-1NMk
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 12:01:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21207f0d949so63554595ad.2
        for <ath11k@lists.infradead.org>; Wed, 27 Nov 2024 04:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732708886; x=1733313686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sN4/UYCKwnjX/w6HTtGzxERNvG6yJdCYTg0zaHpcLhc=;
        b=QnfXVeZDnj/M7PuSzl9zX1NjzEjDNhV7Km4KcX4OgGocLNcnUL8VAAMUEepsnk4Fge
         gZqZ+nmGRSEVSPFox9yCndlsTw3AiVWlITbHYHc22NHtQE9vuG571PoDjsrQ+HLizGFl
         kPWCcwXZUudc+rolVZlVj3j83XgoKBjkSe/qQ+wt4hlqy8bjEdHSssRhvqXUdxHb9DOh
         ZntUFe0qc5PZyLdBg51y9MZy99pdg+TZgi59QCtb+nQ7iFrgbkApGvcFgEaFn/5liqQc
         1Hk8RnLjadWL6W0G9Th4c4iqCcVZHKdStZsmvvgx18X+zdui7hnZPtvRG1k6oU4GRbCd
         fzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732708886; x=1733313686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sN4/UYCKwnjX/w6HTtGzxERNvG6yJdCYTg0zaHpcLhc=;
        b=KhtuNphlSAGy03DoePHSKH2PWRavlb6/gc/bq6TOALe6OyLQTmeRKdrIXbAPDRwNnH
         OFKYrCfKFRfeoBT0z77nq3itY8grKheCWuwW239qXXquMtaq3v9JTHTsGbIs9wtYXbCs
         lDsBO7EvALrLPIgukQyNC0h3fsETMN1/8vtytKv1kjHlhjYqWha9hE5AIWxG041LQvWI
         bMm8IpDC39xdEK/A2ThYEazWOjscL99aiIHJRXmxTCBwZ4nWdCnWT3ucjbtS129LGfCy
         Rhn3lVDNQXCkZO9k9ztLqZ9XFhVhkbW9af4i+QiP8qKjj+/QbyDpyL7qECzF+nTd30Qm
         ksnA==
X-Gm-Message-State: AOJu0YwRgiZ8A0G8k1cRzpuRCEukjCNDny3L5kfdfO+MqZ1wozkanHy6
	r9USGXfW8Jv8EFTReLKl2IeL3VtI3wDJgE8QoyvX9iGsTDfkZw7J
X-Gm-Gg: ASbGncuBnfG6R9vS6crsitRpuf7WQ8CEpGXx2abvrlu2M7nkN1ILDklH3D1bYQuACob
	yWJ+i26fx+7u4eijxYK9QhDUGtP0klBCbQf5y5dcfqYs1i2+3r/+mjiLE2xOHiYtS1vGSA5j2I+
	jykcdfbXfsBMKxyp+MUNn0g7u/D/SbGgI40BhgpeWJxTFyHls2BKbZ/cYfbjqTLxEoU7DXI5dVu
	38FK0xw5h0daogHgh6oy9JqsMpmhk0kxqAMhMiu6bUMhDEYYezFzrzTfPU=
X-Google-Smtp-Source: AGHT+IEU2vKSpnu2XaJg/vWlfp9dLeYI801wk8Jeavg+UoypKKB1w/kg64aUyi32uf7+nu7ZgnCBAQ==
X-Received: by 2002:a17:902:ea05:b0:212:e7c7:6bf7 with SMTP id d9443c01a7336-2150108591cmr32135295ad.4.1732708885868;
        Wed, 27 Nov 2024 04:01:25 -0800 (PST)
Received: from localhost.localdomain ([223.72.121.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c404sm101297915ad.40.2024.11.27.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:01:25 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: quic_kangyang@quicinc.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	markus.elfring@web.de,
	zghbqbc@gmail.com
Subject: Re: Re: [PATCH v3] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Wed, 27 Nov 2024 20:00:43 +0800
Message-Id: <20241127120043.33873-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6f4037b4-8084-4e1d-b339-274e25f6d317@quicinc.com>
References: <6f4037b4-8084-4e1d-b339-274e25f6d317@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_040127_360992_8FBB6886 
X-CRM114-Status: UNSURE (   4.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

thanks for your reply

thanks for your help. With your help and Documentation 
I now understand how to write patch change logs.

Baichuan Qi

