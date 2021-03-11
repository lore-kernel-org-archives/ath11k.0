Return-Path: <SRS0=yIgJ=IJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2776C433DB
	for <ath11k@archiver.kernel.org>; Thu, 11 Mar 2021 06:01:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB9464FA3
	for <ath11k@archiver.kernel.org>; Thu, 11 Mar 2021 06:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB9464FA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xbGKAQ0MugI1pisdFdpVyMuKUtedAb9vVRsTbQF9JQY=; b=WF97XTFynPY2XT2bx0GOQt0qb
	FCJEtoWlumNLQe3VRhD19GJPbCjQbnFD0/+mVA62iLUeS9MKnAHgO6bjj5jddbYjulRa4vWkZmSEk
	JHjzctamggsB6CkoJNwuvnvC16WzbEBJs+Nl5PWaCy3Xi4d0OyBAaGjVqzZQBA+FJMzckzBvZve5P
	BwbnRTHDPPoJzhmK1vJUqWC3Fy8K8BSE50gobbZTpLbLrJhFjYlAzcTH/tPZTw6sLZpZ8BLXboyvH
	DRM2O4K9tg94gV8voEIRPIHhXpA6HcqzcrWenPaPHIFM0sBDXBipHPibs8X+E8ddP5L9djiISdTHp
	1NqXpVZ0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKEOD-008RH2-0Q; Thu, 11 Mar 2021 06:01:41 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKENy-008RFm-Bb
 for ath11k@lists.infradead.org; Thu, 11 Mar 2021 06:01:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615442486; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=iuDEpevXVvAPqRWOTgajEvmqN5hL4zfyLG6VEFB+gCk=;
 b=I37hHNHWbCyuJFCnlb3hR1CYE0lXUoRr/fK7gBagS2BO18iAFMjsqI46V/59LsRuskLVrLE2
 gadRqtYZscWB1Mlaz/rArAIHx1f7QxWVC2TuywuBLrjk/4KzLU7d/NFw4Z74pH7jSp6xag0R
 uyg2UKir+d3KqqT0dxvrz3Zr22g=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6049b234a6850484a6949520 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 06:01:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1CD2FC43461; Thu, 11 Mar 2021 06:01:24 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E57E5C433C6;
 Thu, 11 Mar 2021 06:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E57E5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 John Crispin <john@phrozen.org>
Subject: Re: [PATCH V5 1/2] ath11k: add WMI calls to manually
 add/del/pause/resume TWT dialogs
References: <20210222192651.1782-2-alokad@codeaurora.org>
 <20210309105025.72246C43462@smtp.codeaurora.org>
 <347ccb1006ce48ff6da270560c867c06@codeaurora.org>
Date: Thu, 11 Mar 2021 08:01:18 +0200
In-Reply-To: <347ccb1006ce48ff6da270560c867c06@codeaurora.org> (Aloka Dixit's
 message of "Wed, 10 Mar 2021 10:42:55 -0800")
Message-ID: <87czw6z0sx.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_060129_241530_858C6A79 
X-CRM114-Status: GOOD (  10.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Aloka Dixit <alokad@codeaurora.org> writes:

> On 2021-03-09 02:50, Kalle Valo wrote:
>> Aloka Dixit <alokad@codeaurora.org> wrote:
>>
>>> These calls are used for debugging and will be required for WFA
>>> certification tests.
>>>
>>> Signed-off-by: John Crispin <john@phrozen.org>
>>> Co-developed-by: Aloka Dixit <alokad@codeaurora.org>
>>> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>>
>> This patchset had new warnings:
>>
>> drivers/net/wireless/ath/ath11k/debugfs.c:16:15: warning: symbol
>> 'debugfs_ath11k' was not declared. Should it be static?
>
> This patch-set doesn't add any reference to 'debugfs_ath11k', so
> don't know why this warning came up.

Ah, sorry. That's coming from Anil's debugfs patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
