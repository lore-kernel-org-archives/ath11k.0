Return-Path: <SRS0=IuQG=HT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C40AC433DB
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 02:29:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0DE64E6B
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 02:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0DE64E6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Q4VEZeWww5C4ZLo7wtH800MqNZEunOie60OMdWDvRI=; b=2vgNcudmRPp4M6E3lQwTbsPOA
	Kup2T4LqoY9c+CFDulB9pZX5C7y9PJIeaLXMr3KAgD8u9Spp7BqzuSKKKdh1IPcB5PBL3LThA0S2Y
	z8dVRPeLBTmzWtCRqgy66R7TtpE7GTmKhX8i8z3frccgnpUHTodHSOIVFkdFeRJ7NO9ch71z2ZuZ1
	44r6eJY/Y5u3h1erlFT8O7MYgspy4GMX9uN84BQ135gAFljvpzOGAgGDuhPNmA2x1nb0rZgI48qTH
	hcGXUOAxwWXmE/GBWT9jhyA9mEN75QoYNk5qdgnEW+1jtINDZ80wLkQdSYCEK202ylgh3AaQBoBfZ
	6Zxvbu4fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCCaL-0000DH-KL; Wed, 17 Feb 2021 02:29:01 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCCaI-0000Cs-Nz
 for ath11k@lists.infradead.org; Wed, 17 Feb 2021 02:29:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613528938; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yYdgIAo1Ezv+KQtwbN1C/nqqV5mWYRPAN6dyt7pEHfM=;
 b=ZCU/OwlUzjK6EOCLpaD9LAsOjmgY3RDyAIayooHDjVyn9MnuQ6FwcD3t4F/xBSRt4SG1Y0Qc
 OnJFhA+zLVTi+RSl4SM9F3aw5dN6yYbRdlyZT1jSA8rGMd4WCWtn67if0T1Ysjpk9OBRc5xC
 BqV2fJBhnaHPTWac3oEvrhPKqrU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 602c7f6724187d7bf25c26c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 02:28:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4951EC433C6; Wed, 17 Feb 2021 02:28:54 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4834C433CA;
 Wed, 17 Feb 2021 02:28:53 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 17 Feb 2021 07:58:53 +0530
From: akolli@codeaurora.org
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 06/11] ath11k: add static window support for register
 access
In-Reply-To: <87czx0q7vy.fsf@codeaurora.org>
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
 <1612946530-28504-7-git-send-email-akolli@codeaurora.org>
 <87czx0q7vy.fsf@codeaurora.org>
Message-ID: <c8b8ce58aacef47cdce6398afd53eb54@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_212858_917352_DA46CDA2 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath11k@lists.infradead.org,
 kvalo=codeaurora.org@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-02-16 22:15, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> writes:
> 
>> From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
>> 
>> Three window slots can be configure. First window slot
>> dedicate for dynamic selection and remaining two slots
>> dedicate for static selection. To optimise the window
>> selection, frequent registers (UMAC, CE) are configure
>> in static window slot. so that we minimise the window
>> selection. Other registers are configure in dynamic window
>> slot. Get the window start address from the respective
>> offset and access the read/write register.
>> 
>> Tested-on: QCN9074 hw1.0 PCI 
>> WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> 
> Patches 6-10 are missing Anil's s-o-b. Anil, can I add them? If you
> agree, please reply to this mail and include your s-o-b in the reply.

Sure Kalle, please add my s-o-b.
Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Thanks
Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
