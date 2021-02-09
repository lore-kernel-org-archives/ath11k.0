Return-Path: <SRS0=1RzP=HL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDAAC433DB
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 07:23:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9779E64DE8
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 07:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9779E64DE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jWexaqN0kb3VcFUZHGhOwz9HKkYA/G6l8vMXJ6l2e+o=; b=wxybZDb7dTSVVjhHbDdXDoG92
	n90z4VA8qW6Pm6UAPINiv9MKhB/TdqR53cfKZCiYBGsdHfCc+dd3Txp79yqrmYDVdIG1E6Af+mZ7r
	8gEyR1Y4XoLc/XI1jt0i1b1UBaPahJSWzpIYpktcT6vaRdb/1nFVSF7sLdrFgYMnMrz7V1JRJ1HTa
	/rOGbP3B2nkm172JsPoMy+fe8WGSy+vXBLHRnzoysr1748bsTB8QoWoSxbNRSKd6ltn/7LG7ZZpcR
	6OBgYIEw067h0dLuE5Is/gL0Au/tWUB0OJqfyPop5Ayue3m5nhIHIVnl2TJELFqa1yO+Qmz1K6HC4
	Ko3KDUXdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9NMS-0002ay-8x; Tue, 09 Feb 2021 07:23:00 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9NMO-0002a4-5P
 for ath11k@lists.infradead.org; Tue, 09 Feb 2021 07:22:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612855378; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=HktpW15XiJz9MDgowFxfcyIb7IZPnlAbacfGYBTq+d4=;
 b=KCgPxWZ/GLIZqSD+wknE88zHDRU/LIgz4YCpy/0SyJh9si3AclMNHNdmGTETkV6Io0DcIs6m
 NY/ZzsJN4c9PpwUzUccnZru5OnCaDyx7K9kc8SMQDDXX6lN7bm3Wmm4xAyzf0a4Jl79oX655
 uW7BUCVjt6yXivXdu1BOvfgRNe0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60223844830f898bac82fcee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 07:22:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C3B4BC43461; Tue,  9 Feb 2021 07:22:43 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 15990C433C6;
 Tue,  9 Feb 2021 07:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 15990C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Peter Oh <peter.oh@eero.com>
Subject: Re: [PATCH v2] ath11k: Update tx descriptor search index properly
References: <1612410960-9120-1-git-send-email-periyasa@codeaurora.org>
 <e6d1aaea-8410-3cfb-3308-4722ca8e91ea@eero.com>
Date: Tue, 09 Feb 2021 09:22:39 +0200
In-Reply-To: <e6d1aaea-8410-3cfb-3308-4722ca8e91ea@eero.com> (Peter Oh's
 message of "Wed, 3 Feb 2021 22:10:26 -0800")
Message-ID: <87k0rhvh6o.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_022258_290009_56610C81 
X-CRM114-Status: GOOD (  14.15  )
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
 Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Peter Oh <peter.oh@eero.com> writes:

> On 2/3/21 7:56 PM, Karthikeyan Periyasamy wrote:
>> Tx descriptor search index field should be updated with hw peer id
>> and not by AST Hash as per the HW/FW recommendation. Incorrect search
>> index causes throughput degradation in all scenario for all the
>> platforms. so updated the search index field with hw peer id, which
>> is a common change applicable for all the platforms. Also no need of these
>> configuration for non station type. seen 10% throughput increase in WDS
>> traffic with this change.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
>
> Thank you for the details.

BTW after you have reviewed the patch, and you think the patch is ok,
you could reply with:

Reviewed-by: Peter Oh <peter.oh@eero.com>

Patchwork automatically picks up that and then it would be an indication
for me that the patch is ready to be applied. I like the Reviewed-by tag
a lot as then I can see that others have also reviewed the patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
