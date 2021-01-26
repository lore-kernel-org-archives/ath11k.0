Return-Path: <SRS0=Wntk=G5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6B0C433DB
	for <ath11k@archiver.kernel.org>; Tue, 26 Jan 2021 15:59:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96692220B
	for <ath11k@archiver.kernel.org>; Tue, 26 Jan 2021 15:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D96692220B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gG15G6WoHRUaKdM8DO8DrctJx03kdLgTz5/uA7fvSmw=; b=BEEVfvBoKs2TQr22tdv7ZWrFn
	nP/BgZfc5xwiMA8ebqM+z9LPUjL/CpwfI+qK/dCHIv+5vzn/zwQNfLphA8ZbvG9LEu6ktasoLlnZB
	QpnBfBR+t8zuYcwo+DjhiDKgoiunwCzlabNST34Oh0v/zbTyhtcTEgg4ux3TpDdzkejeqJ2xyMSH8
	CjQet87RSkPMW/fBLXKsB2E8wpzfhnAdsq/jSEmn6B6ZNRfNfQ21IdgZZ3Zvj+wQ/usfl8HxG7smN
	xpJiTwYx25i7M5yxBIYNBKqGUEzBUeVDqpJbXffcR841nU+TsyYecmxwWk50MJHPKwoEWXJ4RFEah
	iFq8IfHaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Qkb-0007cZ-Fj; Tue, 26 Jan 2021 15:59:29 +0000
Received: from m42-8.mailgun.net ([69.72.42.8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4QkY-0007bk-IM
 for ath11k@lists.infradead.org; Tue, 26 Jan 2021 15:59:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611676765; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=D2dYwY0j8YQkxzRXkt/Ed3HBmjzeivBITd/gB7C37GE=;
 b=oadssiaQbDvFzhogSw5vpSWyoaQWRbFA1FNbAv8Dp2bbnaJsHc3Bu6sL56eqplaEQUprf0A4
 CwuM8Kd+P+uB4WYwASfapG3AdELFfBk4+TVE29xb2317QFD+KBbfYArJaXivtvuH+EP/ihUE
 8duQCWRGLqKzZdgMNuqXp62i2FE=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60103c5cd75e1218e3e4bb74 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Jan 2021 15:59:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A8237C433ED; Tue, 26 Jan 2021 15:59:23 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 41898C433C6;
 Tue, 26 Jan 2021 15:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 41898C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210126155923.A8237C433ED@smtp.codeaurora.org>
Date: Tue, 26 Jan 2021 15:59:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_105926_644042_C764D425 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> Tx descriptor search index field should be updated with hw peer id
> and not by AST Hash. Incorrect search index causes throughput degradation
> in all the platforms. so updated the search index field with hw peer id,
> which is a common change applicable for all the platforms.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Please reply to Peter's questions.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1608305041-21946-1-git-send-email-periyasa@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
