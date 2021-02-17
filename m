Return-Path: <SRS0=IuQG=HT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18917C433E0
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 09:28:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94AED64E33
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 09:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94AED64E33
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ojg2aFeSG6AEmZiB/5gNjYLSrvymUzqbvJOKT06ZgQk=; b=dGK8uRTIItCrLwe0vHPR5ZjSl
	XWUfBQkdQ9PB+dbxPXaxC77pbEa1RpFABPN4PSEoxWHAHrYbo6RlYcvPa2TJUd6MIYEQ1F4sU/SBq
	yDz3eaTGBMvw21tus3EtB/bglNUBwN0e/rl8BD2BvcTgQKHjcpbpPFLhaFxF8p8d7Y4CtR8IZOtuU
	Mvtfp9VG7IyrTIaRKjMwbIcUh5ckvAp0DtUs6gsZo19vt39EMPljIJrQQJHy2eLozYpy6sGiaxqsD
	Xlegsj70mXk8eeM8Cs8EwducSJbqQOo+fQm6xEoxOffX37vcgzvbpMwf57YCd7cmFzaOk3RcP78yo
	UJjzRTJAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCJ80-0000vP-SI; Wed, 17 Feb 2021 09:28:12 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCJ7y-0000ut-If
 for ath11k@lists.infradead.org; Wed, 17 Feb 2021 09:28:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613554089; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=IwWzeGqUoM+zPEAt4RDMAPJyW6bnFoWqgmyEf8peoA0=;
 b=ObnVvXnhV/XJhdCZYV4Vi0EQW544UJ2gc8OH1ok9OWUoFQjz5yRJP+xN03jwwXaNXmwu6z1s
 8v8Hs30YrpzpnJ0K8us2b83DhP8wBPEUB+3GjyiVo1dD4Nosn+LJSCVldfFbtwwI0BdVa6jt
 WdnxxOrMr5vXOKQcq20DUOWG5Qk=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 602ce1a698fd902dc2876462 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 09:28:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 83285C43461; Wed, 17 Feb 2021 09:28:06 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 86313C433C6;
 Wed, 17 Feb 2021 09:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86313C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: akolli@codeaurora.org
Subject: Re: [PATCH 06/11] ath11k: add static window support for register
 access
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
 <1612946530-28504-7-git-send-email-akolli@codeaurora.org>
 <87czx0q7vy.fsf@codeaurora.org>
 <c8b8ce58aacef47cdce6398afd53eb54@codeaurora.org>
Date: Wed, 17 Feb 2021 11:28:02 +0200
In-Reply-To: <c8b8ce58aacef47cdce6398afd53eb54@codeaurora.org>
 (akolli@codeaurora.org's message of "Wed, 17 Feb 2021 07:58:53 +0530")
Message-ID: <87zh03oxgd.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_042810_747337_8EAF0FFB 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

akolli@codeaurora.org writes:

> On 2021-02-16 22:15, Kalle Valo wrote:
>> Anilkumar Kolli <akolli@codeaurora.org> writes:
>>
>>> From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
>>>
>>> Three window slots can be configure. First window slot
>>> dedicate for dynamic selection and remaining two slots
>>> dedicate for static selection. To optimise the window
>>> selection, frequent registers (UMAC, CE) are configure
>>> in static window slot. so that we minimise the window
>>> selection. Other registers are configure in dynamic window
>>> slot. Get the window start address from the respective
>>> offset and access the read/write register.
>>>
>>> Tested-on: QCN9074 hw1.0 PCI
>>> WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
>>
>> Patches 6-10 are missing Anil's s-o-b. Anil, can I add them? If you
>> agree, please reply to this mail and include your s-o-b in the reply.
>
> Sure Kalle, please add my s-o-b.
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Thanks, added them now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
