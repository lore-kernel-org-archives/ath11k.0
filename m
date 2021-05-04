Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6023AC433B4
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 17:22:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2496B61176
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 17:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2496B61176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wdn1XFQvOvhbyiBrqiWou+Jrb4DjQywp4l4CU6XfJSM=; b=m0dMYlE/sRpMM5PB6IPtvaI5M
	m9xHFIQPuGVUHwiXg8sNbK1hQ1FYI60gIv4jMLyHhyqOsapLMTvzYLr/83xcthlEJNxdk0ONYH35e
	kLkpD9XkgxxlY40uKDgXM8Ai9oL/Bzj26w/C+TxM2H55FXQ5i6HR7nVci2PpI/7QOq4vXKnYKl2sf
	vXgXqh94w+0dDlFnZVkP7SlmE0SImBYV2Xo17nY3mNV4JQcXe7XQvg9E1kkvBCy197Rj3PoAVVbMz
	X07b+LFlam3dFtV8vLyJQztnEK5L9m4t+MBpyGgmkwit9gHjcstGvuBSIR5z2ONOm7es3cTYGsn6L
	oJUd0jLdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldykn-00GeUr-65; Tue, 04 May 2021 17:22:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldykl-00GeUc-Ms
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 17:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=XPnjEQdH/MrONQdDxv+LvDL8Izda1QOwVSGXaIaeUb8=; b=Bixzwzb3l/C9oE5s5evSrDkcFH
 Uh7YzTCF6fu9fb/3yBTaNi9OzMS1/cYT/1mRYJ+seA8gapokgJ97AhtyC5l3qmPUwmAR3O4KvNM9H
 i0b36W4fcwqA8WVRgZC7NHuRvjghbCFCG/WmoMDtOckWAoeyXtNnJLpQl2UNvTlc3UY8ltCu0lRVL
 Tn/kV7XnhGkNxH3Z7NM8J1a/YUMvtI4g3RTQgj98hZmmLtDRHADP7T7gDWMbFyVJHJXuCfr3axIFF
 44abVdGlbvv0JtYhNXxuD80vtjvjycUykstABAcS60LLLUVEDgvWcnfUr22bC4MFWFNx8S8WhgWx0
 6YKIjR0Q==;
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldykj-0048Zy-3t
 for ath11k@lists.infradead.org; Tue, 04 May 2021 17:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1620148953; x=1651684953;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ssj0HmLsFhXdKgRKpNyTTL8WYgWUKhN0JFV+gJMwx80=;
 b=HFs9sedWGRBR+16vAESWyR6JKh4CyNYQVeTS3PjkgjO/csZYML2LQHio
 jPRYR5GKGfvrJSACkAk6y7Xpo705Kt+0KrtyLyhGRtE7ToDF3qNp3llDL
 V17OmorX3a57pQ5MwNDBV3fSiTZTaQkWn0iRx1L0zpAG4dhPgjtUBQVYs M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2021 10:22:29 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 04 May 2021 10:22:29 -0700
Received: from [10.226.59.216] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May 2021
 10:22:29 -0700
Subject: Re: [PATCH v1 1/6] bus: mhi: core: Set BHI/BHIe offsets on power up
 preparation
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
 <linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
 <linux-wireless@vger.kernel.org>, <kvalo@codeaurora.org>,
 <ath11k@lists.infradead.org>
References: <1618598825-18629-1-git-send-email-bbhatt@codeaurora.org>
 <1618598825-18629-2-git-send-email-bbhatt@codeaurora.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <5f0001da-bc1a-5649-ef72-1fbadd5b44ec@quicinc.com>
Date: Tue, 4 May 2021 11:22:28 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618598825-18629-2-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_102233_216429_BBBCED41 
X-CRM114-Status: UNSURE (   7.48  )
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

On 4/16/2021 12:47 PM, Bhaumik Bhatt wrote:
> Set the BHI and/or BHIe offsets in mhi_prepare_for_power_up(),
> rearrange the function, and remove the equivalent from
> mhi_async_power_up(). This helps consolidate multiple checks
> in different parts of the driver and can help MHI fail early on
> before power up begins if the offsets are not read correctly.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
