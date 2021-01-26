Return-Path: <SRS0=Wntk=G5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3E3C433DB
	for <ath11k@archiver.kernel.org>; Tue, 26 Jan 2021 17:31:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ACB520449
	for <ath11k@archiver.kernel.org>; Tue, 26 Jan 2021 17:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ACB520449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l3wFy7xnooe7tf2Fq+C6CW/P50A3BP8mcgTOBkSFzSk=; b=ubU4d85BGpO2L8eTNl1+juvbt
	qR4hcwVc6NrcuRd4SwkJkUmWCGt3kTEcsJC6+fgR7cDJegdY4h3Vnfiw15yKvcrMg47/z4cR//MHv
	1T7vBOImob3gOH2zBUKi5yBb6E1rzooy3zo6KM1Hp8/qYjNX8jCKphoYZy+V1pFikr/CQIZm86Xvp
	crGPcn9A/y+IJdMMR757U5MCifFOTysfYVZr8JvexAGiIYibufxSQZM+5o/TYnBYPPs98lI8FulsT
	M3SWvfUoL7kE7nFriYYDWEW3UoovemiFHD8PoCCyUR6V/1oztg4Q2ekqMHSSOJ2HoRqUjMtyVjB91
	e9ySy38Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4SBh-0008JE-Rk; Tue, 26 Jan 2021 17:31:33 +0000
Received: from a1.mail.mailgun.net ([198.61.254.60])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4SBb-0008Ib-WE
 for ath11k@lists.infradead.org; Tue, 26 Jan 2021 17:31:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611682291; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=qd8eFHF9sahtxnasGHzr+j1A6XXP+KsTxTl3+ooZsMk=;
 b=GVl4dMylg5NfbUbVFM2UPNbSJ8/yEP6WH39JhAqIncbL/WVUyANAxBRT6N2KfVNW1guy1DWO
 /YSX+dm4TciFSggMSZcR0LK8P1UqeR4n7h/j+3Y5dXuT2unzqisUJ80jcdsVFeXIRfQnsy2s
 MUsK3o7W/GDsqXrIzvX8GDEUwn4=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 601051e7bdcf468287cc4781 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Jan 2021 17:31:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 26747C433C6; Tue, 26 Jan 2021 17:31:19 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CCD7AC433CA;
 Tue, 26 Jan 2021 17:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCD7AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Subject: Re: [PATCH V6] ath11k: add multiple bssid support
References: <20210120003221.21984-1-alokad@codeaurora.org>
Date: Tue, 26 Jan 2021 19:31:14 +0200
In-Reply-To: <20210120003221.21984-1-alokad@codeaurora.org> (Aloka Dixit's
 message of "Tue, 19 Jan 2021 16:32:21 -0800")
Message-ID: <874kj3bo65.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_123131_454381_355A7CEB 
X-CRM114-Status: GOOD (  12.81  )
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
 ath11k@lists.infradead.org, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Aloka Dixit <alokad@codeaurora.org> writes:

> From: John Crispin <john@phrozen.org>
>
> Add the required wmi support and make use of it in the beacon template
> code. We need to split the beacon code up into 2 code paths so that
> we can also send EMA templates.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>

Please CC ath11k list with ath11k patches.

> base-commit: be8cd9b8f5ed435c27530430aa1b1da30f9825d5
> prerequisite-patch-id: 1c9127eb0d6efce75a0aa085527bf81ced427387
> prerequisite-patch-id: 41af1c46bdedfa8768dd4205bb0647101de27dea
> prerequisite-patch-id: f197607d75899cbecffd775e1ca243aa2fe082d0
> prerequisite-patch-id: 55dad75c4f560213110f57f1abf24d9b7301a1b2

This fails to compile for me, what are these prerequisite patches?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
