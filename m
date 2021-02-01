Return-Path: <SRS0=JrPu=HD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD676C433DB
	for <ath11k@archiver.kernel.org>; Mon,  1 Feb 2021 18:26:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F0760295
	for <ath11k@archiver.kernel.org>; Mon,  1 Feb 2021 18:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F0760295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eJ9rz0RgFgB8puWKUAHnCJXVlzulLyflSBW1WCR+iIw=; b=ZKKuFuUqaydBpNNNXY4deHp6L
	C6SY1zk3uQ531LHjrWL8jWgRk3E5BbttwCQ8YFFO46q45WN9oRbQSP/2NNTFo0nNM0ihgMGeuLMZn
	ww4MpfZ3SC1Ka9pCTDUJuRMEGlQL5+g6olB1yfDlcx3EL4dqoR1i8xWBW8pscC6OfLnbpmYGdJ0zi
	FmfXG8BTdKUFSMVaF6mxCGjsRxNJK/TUhEFV+CdJlnoJSdbFsFroFtdUcFk8/Q5p/6K6mQ63g2sNL
	BWhVfCB264V7R1ZmD7GSWCIExCsgfAOFwQwozQ2OxsV2hTIXh9TR4sCuQoRLgXOSzYa7TciZR1F3b
	3PqxyWsQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6dtn-0000KE-OG; Mon, 01 Feb 2021 18:26:07 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6dq4-00075i-9u
 for ath11k@lists.infradead.org; Mon, 01 Feb 2021 18:22:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612203737; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=D5j2d0ccVJEiALSsLxaiQwPqUhJiQ8uL4wmsXcm8le0=;
 b=PWC/0+H4dIzSbksrUbU0726bpUry7M5HfR8+4mSqvgibuwKmUeZ9094eIoZ66v34/297l8V9
 DIs+D64JkDKS82cWK0bwZoonNdpAGrLty+X7OLa+PwbTFjh5b7ye78dMvMncSAQ+NWmzUy1i
 V+DnAeVeCO44RAHPuwVZRjNISBw=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 601846d1f71e8b9934cb3d17 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Feb 2021 18:22:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29ECBC433ED; Mon,  1 Feb 2021 18:22:09 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: alokad)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 79121C43461;
 Mon,  1 Feb 2021 18:22:08 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 01 Feb 2021 10:22:08 -0800
From: Aloka Dixit <alokad@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V6] ath11k: add multiple bssid support
In-Reply-To: <874kj3bo65.fsf@codeaurora.org>
References: <20210120003221.21984-1-alokad@codeaurora.org>
 <874kj3bo65.fsf@codeaurora.org>
Message-ID: <7b36901091429419209653f1be21cce1@codeaurora.org>
X-Sender: alokad@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_132217_742238_BDEA997C 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: Lavanya Suresh <lavaks@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, kvalo=codeaurora.org@codeaurora.org,
 John Crispin <john@phrozen.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-01-26 09:31, Kalle Valo wrote:
> Aloka Dixit <alokad@codeaurora.org> writes:
> 
>> From: John Crispin <john@phrozen.org>
>> 
>> Add the required wmi support and make use of it in the beacon template
>> code. We need to split the beacon code up into 2 code paths so that
>> we can also send EMA templates.
>> 
>> Tested-on: IPQ8074 hw2.0 AHB 
>> WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
>> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
> 
> Please CC ath11k list with ath11k patches.
> 
>> base-commit: be8cd9b8f5ed435c27530430aa1b1da30f9825d5
>> prerequisite-patch-id: 1c9127eb0d6efce75a0aa085527bf81ced427387
>> prerequisite-patch-id: 41af1c46bdedfa8768dd4205bb0647101de27dea
>> prerequisite-patch-id: f197607d75899cbecffd775e1ca243aa2fe082d0
>> prerequisite-patch-id: 55dad75c4f560213110f57f1abf24d9b7301a1b2
> 
> This fails to compile for me, what are these prerequisite patches?

The prerequisites are these: 
https://patchwork.kernel.org/project/linux-wireless/list/?series=417275
Compilation shouldn't have failed though. Once these are accepted, will 
send rebased version for ath11k.
Thanks.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
