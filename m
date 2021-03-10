Return-Path: <SRS0=lD8x=II=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F46C433DB
	for <ath11k@archiver.kernel.org>; Wed, 10 Mar 2021 18:43:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4EA64F9A
	for <ath11k@archiver.kernel.org>; Wed, 10 Mar 2021 18:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4EA64F9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8aPBcfCkalG2YYanTzQiUblzBt5PNbxST8PDOVO4WWk=; b=hduaflLiWy3kZI9oxS5IXAEHu
	sHFP0y3oAS1/dq0mtf3L5mkYIl1y/2wFlIGEnCaWmeDtTAKLvUjebpSZFEPNy8xj6qd7O04UAp+Oo
	8PL182QU8KK0s22s2QtmxjY3+62RK17PcO1dRB2d8LaOE8fa77TnrTwhHVpe3neCF/2sE6Cvab3sB
	JX2kLmNHYfW0QCHbipXuzQKnaC7OcrW9J5edT/viKWNonSYDTqz1hVt9jj1eYiILwS9kuZOva3b4m
	F5dkPUhFzBvl9CVCAyVKboi3Db3HX922k2HUuw1Gx3jDieA86zI4tEYaYsBcQ+AfYqg1kAe50OJZd
	7dXsF0FQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK3nV-007XcE-K6; Wed, 10 Mar 2021 18:43:05 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK3nS-007XbY-LG
 for ath11k@lists.infradead.org; Wed, 10 Mar 2021 18:43:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615401780; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zWdA1/qwcLwTHVILF0u8OCFo2xoTuL1GRG3lSJyRzSk=;
 b=Qbulw7FKar96p1koNhe36aCSfMLFXzQHzFQ15SCZOgJ7uKqGlU7P0AhdsfSA+QtnVtRs11OK
 d4B+gPoL2cQnZPT/c8/XbR4s2XiK32UMYkrU8Qkdd02Oz7JlUukWatJ1FYnTANfVwoJytXcI
 7dT+jfAFCw/ZrPbXxB+6i0v21hQ=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60491330fa6ebd85e8ff9461 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 18:42:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 384DFC433ED; Wed, 10 Mar 2021 18:42:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: alokad)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5BD5EC433CA;
 Wed, 10 Mar 2021 18:42:55 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 10 Mar 2021 10:42:55 -0800
From: Aloka Dixit <alokad@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin
 <john@phrozen.org>
Subject: Re: [PATCH V5 1/2] ath11k: add WMI calls to manually
 add/del/pause/resume TWT dialogs
In-Reply-To: <20210309105025.72246C43462@smtp.codeaurora.org>
References: <20210222192651.1782-2-alokad@codeaurora.org>
 <20210309105025.72246C43462@smtp.codeaurora.org>
Message-ID: <347ccb1006ce48ff6da270560c867c06@codeaurora.org>
X-Sender: alokad@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_184302_868673_E66F7774 
X-CRM114-Status: UNSURE (   8.65  )
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

On 2021-03-09 02:50, Kalle Valo wrote:
> Aloka Dixit <alokad@codeaurora.org> wrote:
> 
>> These calls are used for debugging and will be required for WFA
>> certification tests.
>> 
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Co-developed-by: Aloka Dixit <alokad@codeaurora.org>
>> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> This patchset had new warnings:
> 
> drivers/net/wireless/ath/ath11k/debugfs.c:16:15: warning: symbol
> 'debugfs_ath11k' was not declared. Should it be static?

This patch-set doesn't add any reference to 'debugfs_ath11k', so
don't know why this warning came up.

> drivers/net/wireless/ath/ath11k/wmi.c:7143: char * array declaration
> might be better as static const
Will remove this array as per your other comment regarding
adding a helper function.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
