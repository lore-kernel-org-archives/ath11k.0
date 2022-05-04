Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15982C433EF
	for <ath11k@archiver.kernel.org>; Wed,  4 May 2022 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAC9vkRhqxM+I1RhBUMbXZr+kOTlfHI59shxYo7Or4M=; b=o1P1Bgr7X79X6I
	d+2jAJt2eXPRqa88n5NpoFznyi2JZVPRhyQz3XrM1qiZ3PQ/Wz/MHoBiQswAYtb4jfLlsT4qNqPiq
	xrkyhDOY9SGmpSw0CM18ci/xFcpP+zFBIDpM3AiDBSkjGJVCQvwn9bdVU+LRRKgbBV7vaYD/hthOl
	d/Xl9Lq4I8bq7wttaTfJKFMsF1bX4ks0AIimTlAJ1mr0wMMxYqdIcVo46mxsZxmTYt4nF9Ldvbm+0
	vz6ghyGSC2ETAzhHDMKXUfMvkE2R6mkYL7zpbjxj6v/gmk/I6TEZ7hZry8IXMsc5UPIg0cWgognW6
	3cuMOdxT/aHvcJVCliSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmHtk-00BfTh-Bo; Wed, 04 May 2022 16:30:44 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmHti-00BfSa-1u
 for ath11k@lists.infradead.org; Wed, 04 May 2022 16:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651681842; x=1683217842;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/qBtQZWMA2L7faezufYuvu02cZEmCyrdBXZuae/DfDw=;
 b=Jsbfrg4c2UQGwpx+4XjFaRLLUgz6LBnsKgWgoFxoiFeeNCmq3C7VlEFR
 luP5eao3ZD8SxSZFRMjaFlRpqr2SbA/lo4F6VeUfEzPLdIGIrHzLnLkVF
 7IfZoz6Cl0PvJ0+MhEiALAMZH4mvi51oV5sko1TQiHddjsOtDGOZK66nQ 0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 04 May 2022 09:30:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 09:30:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 09:30:36 -0700
Received: from [10.110.89.220] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 4 May 2022
 09:30:36 -0700
Message-ID: <1615688c-fb7d-261a-7b01-fe47c74b9597@quicinc.com>
Date: Wed, 4 May 2022 09:30:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] ath11k: mac: fix too long line
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220503060415.24499-1-kvalo@kernel.org>
 <f2f27831-03eb-3788-5855-649c0f33c785@quicinc.com>
 <87y1zhalfy.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87y1zhalfy.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_093042_182661_48513647 
X-CRM114-Status: GOOD (  12.79  )
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

On 5/3/2022 10:58 PM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
pe>> is there a reason to not declare deflink here?
>> then its scope of definition would equal the scope of usage
> 
> In ath10k and ath11k I have tried to avoid that and instead declare all
> variables in the beginning of the function, this is to keep the code
> simple. Of course there are few cases where a variable is declared in
> the middle of the function, but that's just sloppy review on my part. I
> feel that it's better to refactor the function into smaller functions
> than start declaring variables in the middle of functions. Does that
> make sense?
> 

This is really an academic question.

In the larger kernel community I'm seeing a push to reduce the scope of 
identifiers in some cases:
1) declaring loop control variables within the actual loop control operation
2) prohibiting the access to list iterators outside the list iteration loop

 From a software engineering perspective limiting scope can prevent some 
coding errors by preventing new code from being introduced which tries 
to access an identifier which has not been initialized.

To that end, I fully support the guidance to refactor into small 
functions where variable scope is not an issue.

Also consistency is extremely important, so I totally embrace having a 
consistent approach.

/jeff

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
