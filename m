Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8542E6FE3E
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIUpFbrjPb0P/mKGL9WaJYHJmPqeUafGZLz6LgG9eVg=; b=FnWHrzmRaGU+K3
	Ola2dBXBzXMW4ZtrXMZ4CkQ4yS1v6UOLFOq8fr6KcyCKeYmSg76/gaxWjQfgJaoUqkXuJHEOUzipw
	IqzDtVfCwFv2w6agAd/rffK0eq4dqz4oyxKSNOmYyxdsAz6EMndrkwL34rwxdT5CoinFOcrxHZ50i
	d6KwuySuhTNh/hixdd0U6HjSLRBz7MIbJi1054Fd3WEJJTCuv13mGPxDxTy1btqz4xDWCrHE9+oFU
	cajQv9t1H8590MA22LRMsReehOXhGNlfX/dn6MAb3Lab29WOCSSoCBrkBcZgtImvZjDgnymOvFJVy
	jEQqtFB3qf23aUq2j9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhKY-009E3f-0t;
	Fri, 22 Sep 2023 14:40:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhKW-009E1w-1b
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 14:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695393626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGnMCyubh7bE+/HJGj4DK0rgvnpm1pyHq1+UZD2NCjY=;
	b=VbVQRiN3J/8nbxfz7R4heChBOhXHRhGrmGAQf+26ocGHC2KzkAtks7TjjuINyvc8fYlMZT
	6IvKhyp2rJKFsOyZ/a0XWnMZEKGXTYVc9RZ/WPNgyGWaywZrqv1LRB5Je4bSqvp7RfWAkY
	+sOsKYetEPUt+JmYCG1jFgjKWO5ajE4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-h-j_7iwQM6ub9BnngjW_3w-1; Fri, 22 Sep 2023 10:40:25 -0400
X-MC-Unique: h-j_7iwQM6ub9BnngjW_3w-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-530a085c62dso159330a12.0
        for <ath11k@lists.infradead.org>; Fri, 22 Sep 2023 07:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695393624; x=1695998424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGnMCyubh7bE+/HJGj4DK0rgvnpm1pyHq1+UZD2NCjY=;
        b=YdQP3rWtUUsVmZaVdAlLWWn0OAK8epf5rc8GejSXArRolTKazHhRcMs5xIqBlpg3be
         DZel9Dgg2wP7Pr0nuSKRjjxtbeLBi25OWOcV4rxJZXBNgpZobM4VNWr0bJomD+7qDUgb
         jZjC722+qRJhHAXOYCncDuBxhm4DFQrtqpQ7ww69S7kKn7XMOIBXULH/L7/v9cT/RwYM
         7Gws65gWSzUFTWNQgXChaTB+6iOvSbLEg5F+xAuT9gJFNk6fW2bC+Ddk2Za6YJ69mjeF
         0kz74nuHNUrLxXr9AvGti3S7benEXLvLAiHZVYCHCYv2FTOIu8DIEYAv1m9+V8KGpmcf
         cODA==
X-Gm-Message-State: AOJu0YyzY8n51coeVOD1dTxcCTE91YqCmbfZL2v3HmzAraGjgKJd3Irv
	Uo/BJywUNf3EstxptH4nP32no4lqJ+thAHj2zmBlTCO/6SmRwJMwlPhhtiN6gLXwJZx1iDd3KRS
	5EkPi5qumRLKjgj5vNzutd9aaMzI3uIT3aAoSFw==
X-Received: by 2002:a05:6402:51c9:b0:523:37cf:6f37 with SMTP id r9-20020a05640251c900b0052337cf6f37mr7551714edd.4.1695393624167;
        Fri, 22 Sep 2023 07:40:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaeMW0q3DuXsz0kHM9h9ZNaXKgZp/1aLg9254A9wa9TAeKK35Kd9zJ4ORdo4O86nq3u3AP7AmJn65V6xp8rOs=
X-Received: by 2002:a05:6402:51c9:b0:523:37cf:6f37 with SMTP id
 r9-20020a05640251c900b0052337cf6f37mr7551703edd.4.1695393623879; Fri, 22 Sep
 2023 07:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230922120040.15460-1-jtornosm@redhat.com> <b5fa2ea0-d025-47e3-a1c3-eb7c2f6bc5b7@quicinc.com>
In-Reply-To: <b5fa2ea0-d025-47e3-a1c3-eb7c2f6bc5b7@quicinc.com>
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date: Fri, 22 Sep 2023 16:40:12 +0200
Message-ID: <CABk-BGuOxCeHH0wJX9J3KBdn58nLDGnhWSn1Cma9R8AS2Xe_kQ@mail.gmail.com>
Subject: Re: [bug] mhi: ath11k: resume after hibernation is not working
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kvalo@kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_074028_660389_E8ADF808 
X-CRM114-Status: UNSURE (   3.99  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

R3JlYXQhCgpUaGFua3MgZm9yIHRoZSBpbmZvCgpCZXN0IHJlZ2FyZHMKSm9zw6kgSWduYWNpbwoK
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
