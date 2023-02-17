Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BEFC636D6
	for <ath11k@archiver.kernel.org>; Fri, 17 Feb 2023 18:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqYoZNcEMavhKFgaIjXvcAspFP/M84WR+mYPcUW03cs=; b=i7b3cxnGjsWMyu
	rQy7nLOQPD5N7eNdFNKtzZ9H8KXULdbMz82YRRjhuhCZlE8PBOehr6E29Z8Zc6A3YW5FDFAEJ+I1g
	EzPk4OOdeB/ILWbL6mm2H4O8wIzXLBgzPfQY2rXqQc89VvhlB61j8uUMsbeKocdL93xM2xmOZ+W6Q
	C/Qd6B2VUrOrJJy/ZB4wef/7m2TipPfoM6P7Ln2ztberWzSNmnQ4YaGWcsC/VhqZ8HG7WITXmqcE7
	YLNuZV/Cc3/kvIrl1aZmLONk6AcNc2e7UzrjSrCD0Nmiqnlohq8znHeb2f42re42GMn/r2ie17nEY
	SBsevVG3ffbmewNvsI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT5ux-00FQn6-7m; Fri, 17 Feb 2023 18:57:11 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT5ut-00FQmE-K7; Fri, 17 Feb 2023 18:57:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id ee31so9380252edb.3;
        Fri, 17 Feb 2023 10:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZK4iMZWPcfp2djDH5P0nJB7FnClrPgur4nJbLfogCk=;
        b=bZkI+ZDXWkrlkum6pG5qrsYh7zAUJjViKF2N+coifZDNAFQzSmAVvKwhtyyithADh/
         gSFcZmiDFt+BdovUlm1Y8dEFajX597ZLDRdjmAvuKM0VL/B7wpuZJlzYI9Ev3P4sXXEw
         UGqFjvhk9PZBgTa3sxKf7qR++cefhVBacAGf1APiD4/fAKXnlnVdyjRMh6IqPkNS2DQm
         ANSF8l79YXWYKzq0kvW60KEVoRRbOjNHNYEPka3FWGaThfWqCPU2/rr1R3vmrvGqfDHH
         VnoaZqCNB1Wg/bL+bfOw2N1KlxA1DasnWSFx17kcjWKlf3OqaGWGS++BU/QxDULbV4Q1
         psbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZK4iMZWPcfp2djDH5P0nJB7FnClrPgur4nJbLfogCk=;
        b=tIp/v25JCEcFeVaoe/0+2qhf60TRCt1ZAvWJeReCFUGItb/RyXxi9P+56x4maF7FGP
         xaXEZTD8J9HOFa5e0Obaedm+JDmbF51jVbv3X3HK7a4XBvq/60yTLb/YQTmSp+1Xb+J3
         HiY69OEstTa8QiBtuXpy+VbR6i0gW+wV+zXEhPf5xdrpCFDcJ7idMgtZfSt0urcNMBag
         eOrXh1E++szUDZXUCkSqw2axLyncu/qaeay4QLnlyRMiB2bOf266d1KKzL/qCpBm5HW3
         7VAmNJ4xuC98LXvsalm12X+B6JHMnUPcJlbUV2pWlHAy4opFRre0jBceydrs7nG+uPY7
         Gygg==
X-Gm-Message-State: AO0yUKUDfVWK2zz9WeX9xf7pTpOfZ65Tb3nGmcHYBAAsiqpfSSTLEnE5
	poi10RDFrFEVwcWyLSSAPkY=
X-Google-Smtp-Source: AK7set+b4J0inl8B8lYw3XAZ1JbIGLoKK4Xzv7T394iQRyeJB1n7MeyI1/ZTlH5SwHtulf0MrhSxEA==
X-Received: by 2002:aa7:da8c:0:b0:4a2:6573:5c35 with SMTP id q12-20020aa7da8c000000b004a265735c35mr2463967eds.21.1676660224484;
        Fri, 17 Feb 2023 10:57:04 -0800 (PST)
Received: from shift (pd9e2966a.dip0.t-ipconnect.de. [217.226.150.106])
        by smtp.gmail.com with ESMTPSA id j17-20020a508a91000000b004a21c9facd5sm2659347edj.67.2023.02.17.10.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:57:04 -0800 (PST)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.96)
	(envelope-from <chunkeey@gmail.com>)
	id 1pT5s1-000HLD-2b;
	Fri, 17 Feb 2023 19:57:03 +0100
Message-ID: <c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com>
Date: Fri, 17 Feb 2023 19:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
Content-Language: de-DE
To: Kalle Valo <kvalo@kernel.org>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org
References: <878rgzuw37.fsf@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <878rgzuw37.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_105707_689266_637C7897 
X-CRM114-Status: UNSURE (   8.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On 2/15/23 10:17, Kalle Valo wrote:
> Here's a new pull request for ath10k and ath11k. We have new hardware
> IPQ5018 and various updates for existing hardware. Especially many have
> requested the firmware update for WCN6855 which seems to fix an
> important suspend problem.
> 
> Please let me know if there are any problems.

Could you also please include all the QCA9888+IPQ4019 boardfiles updates
from last year too?

Cheers,
Christian

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
