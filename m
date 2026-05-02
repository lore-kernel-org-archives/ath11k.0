Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C869CD3427
	for <ath11k@archiver.kernel.org>; Sat,  2 May 2026 07:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXZ4zjbaOSRY7Q/S0vThNdYI3+newzohnQo/7Wbdrz8=; b=Gj6jv90Y7Ml36wkIhFWl5crPfR
	57gMC491/Goxj5h5ZyrOvvdmmvJ+MdhUPj00nctPQlx38tdTjZn7FVeSRgKBIGvf/OrXLt9jzR1Kf
	dUOQOy8Bt+dZFPndxdQ9pZD/NAFgEt03F1jjP9GsRZ+PZYS3D9V9Pocq7DycqwWmHyZFS9HnAkfnl
	uWekvxAWdHgktAQTS+IeaHRbIHAkhSmJD5sQROJQVeRk2Z889vfbgh0ymLFgR0svH/rjgjwpjBbC1
	FhmYewpllKmEK9syDt31hzn9MQgYCOm0QpMnjjVgimns3nYSxZsUCZ/yekkKa6hx6z5kolJQVuGKq
	iqsTFueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ4Z1-00000008Uha-2UKu;
	Sat, 02 May 2026 07:14:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ4Yy-00000008UgI-3D32
	for ath11k@lists.infradead.org;
	Sat, 02 May 2026 07:14:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso32989415e9.1
        for <ath11k@lists.infradead.org>; Sat, 02 May 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777706094; x=1778310894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXZ4zjbaOSRY7Q/S0vThNdYI3+newzohnQo/7Wbdrz8=;
        b=ryNdKQ2DJHqhbCoyUXRYKUeKWb142QqABxu7Sdj2HjLro1CQiywwBn+4+YnXlsF+V9
         pzMmP1Xuyn5bwVdUHeXKrb9riFfja7cJR/6vy6ZCOmqYi/V8+Q2Zuz2E2eJTZ8LE09sh
         7+Mmz7yKPWimzKEj+xTVVkP4XZX/XpDBcFh4dqzx2m6szHv8Lf65sf/tBf3IWX95AhTI
         g8yZdeMmUttsPg8V+M6jG0lHcyFjwbNWIssPocQldr3lHYNDP6ZCfhk/1WRkmTw/whyw
         dj80uXY+ga8WKBJUIQBgRBqujZlP/MBKGYZLSDa40L+W8GCseXc1ZTywzGyfVY7c+2mQ
         Q2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777706094; x=1778310894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXZ4zjbaOSRY7Q/S0vThNdYI3+newzohnQo/7Wbdrz8=;
        b=gG/scVunKd//BjsbNARShWzUQ8rt3A9lsfaD+WRWXGYoJsAC4z/MUoPfJTy2RygS8p
         0De+8Si8JGIfagbYxevy3N4wIXbRs54rgrCBoEd1FL9HZe/G0F7PoLIO9k6fipZfR8cD
         B7FWcB0XlTXDnd7LESwPqpEPnNPHH9q6UnDuJ2qjhWd2dQGIdk2VT4wgm16+fRWAMsow
         9HApD8iq2RLZZ3jtaykJR5sUNlRdJBOK1Be5u1gvhEWH8c9B3IN6FaD+eY5SuETUj5ok
         pTh57ZfxD9A0xMIAuhtrSypUZS8SbtTi9d6uC+9E/4Pl9ijloXKm7PucZijZv4ETUC4F
         YdnA==
X-Gm-Message-State: AOJu0YzNpBDMKhwDlkksk/ta82fhcwRHD+FOJW1n7WsPOgQMqylRrlHM
	2M6pvxiDPmT8bJa9E1XhX483o6Xto/DCcNdYZ71eHD7TzfsfIdczMg3HVkTMKA==
X-Gm-Gg: AeBDietD0J5X+3nKPjiRhEgi5tJP1t1/ga9GBonNsZ3OLcoj9fL0rlsL4OglQL2Ntgg
	5LSSNusGmIo0annTw8vKGN4pwmVpNnte0IuvSAGWUochrc10rY38JqLxMi/7aNbc1GqPSfOJouT
	VKBJk/3tfv9Axz+/D+NRcyzAhZnfh6RqhieCXqg1Nz4BJabT/RyxaozPbnNw3A1ns0u4+od+fi6
	c3XYaxmj2a57eGLAAbZ5EV/MOKSeMFSbyB7cXWAnAq1Uq7DjMYu6TivUqiRUerZXocqnttC/+kp
	1hMtrIart4J/c6QYw9wwh28DL1ggO/6ldCONAYtjMuMNKWQ+PSsC6zC56EO2x+pSQzDKUN6xxp3
	yMmyo+HOQjwt+5Wpz3K1OTSAouBJh+7DoULyFVbIZEFNl8rKi+oJn6JRo0iy7LyY2bf4Fc30Rfl
	VTgjSinWEkQJi5z2kvlGhQ80T0jVSj4kIyKxYt63nM6T6seYJWd1zHLZKozOF5TPVOjFU=
X-Received: by 2002:a05:600c:1c12:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a970a9098mr35975045e9.4.1777706093865;
        Sat, 02 May 2026 00:14:53 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm281862135e9.9.2026.05.02.00.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 00:14:53 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath 0/2] fix leaks in some WMI error path
Date: Sat,  2 May 2026 09:14:51 +0200
Message-ID: <20260502071453.2379188-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_001456_802721_C1173119 
X-CRM114-Status: UNSURE (   7.31  )
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

So this is similar work to what has been posted here [0] for ath12k.

When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
explicitly checking the return value we fail to free the allocated skb.

This has been split into 2 patches per Jeff's guidance to hopefully
ease the backporting process.

[0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico.escande@gmail.com/

Nicolas Escande (2):
  wifi: ath11k: fix leak in error path of some WOW related WMI commands
  wifi: ath11k: fix error path leaks in some WMI calls

 drivers/net/wireless/ath/ath11k/wmi.c | 131 ++++++++++++++++++++++----
 1 file changed, 112 insertions(+), 19 deletions(-)

-- 
2.53.0


