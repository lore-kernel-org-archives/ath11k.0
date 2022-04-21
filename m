Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69534C433F5
	for <ath11k@archiver.kernel.org>; Thu, 21 Apr 2022 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kebk8oylhQUW4BwEJoSQX43dqJJFcQtxsiCwgboYXJI=; b=FAVAwFtPGbnHdF
	s3jq+QZqDHJCjL0mQs4w+C31oWUs6eS7RdP6KuDYGMxjXbSSbNAIxvRPmLNpFGGZSkq3Eg4UDKVXb
	y88pbOCHUXW/+nekadc4coDlHCSzzDht3V6xRCZmwcOjzS0Mju0wntB2eOIGs0FVqJl5p3FxkXJ1V
	h8KOyQtaRG30ON3+AUguHy2BE+co2vnX52mawIe4zW42PslZeHe+uGLhDOwHwXY75wI/v/viCOcEI
	ml12cUwWG9V/MABrsUjp8uCNvJzJbeIBRMgHA3aiHcml6RdH8dFfWDblQyslnsDzhs5BUq+TXTS5L
	bQlWb8ihzZorEQ1fZLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZ2q-00E6TC-Et; Thu, 21 Apr 2022 15:48:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZ2p-00E6Qb-C7
 for ath11k@bombadil.infradead.org; Thu, 21 Apr 2022 15:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hAyaL+NaPM51l2STf3JbHp0XopDgxDNvlRTMP8uyqBc=; b=QRAdA/NQLLzh06Gl2vkIpN6Md9
 vAPGYB0fRPmkB2KOeS9uQ3ij4qqlUkLhc1/Wo9zfap3klped+awT0SgtgE85CfQyn6QRY/3dQGXx7
 Ab973JRdsQpUexCpxb45BkvlyuHSraUkvU3pPGgDkqhKjEP0fxrYhoHu7QpZnfK7uSMQSB4sb9GHw
 u9kjSXtuSNSoz+X0nJt/SmQbwxJ4O9SOP4EzEyo4PRQM0ybo8uBGhBOlL6gEyqzOGvsgQpvtMyRHx
 4ubwJb9HiG2vIXOlRZVG5AlA6m97/3ELWUH8a5fjEwwvv6RhDZUsck0StMk7shfKI56AJmQBpPlmI
 A/1VIbyA==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhYNV-007QHp-EV
 for ath11k@lists.infradead.org; Thu, 21 Apr 2022 15:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650553553; x=1682089553;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hAyaL+NaPM51l2STf3JbHp0XopDgxDNvlRTMP8uyqBc=;
 b=nU1KYfB19fWwmedlMR6cp3nwh9GirJihqyjj/oHMI9CCU3EdV528mLlj
 0tdGABGHLRBRvMJj8pd63yRh3EsUYRSG4d7E6FJ71PqVglXSGuGusxjXk
 dBJfkwLybJe1VwuqCJIJPpL0x6n23+4FDiU+k6+++GYCz+4JbDxPhfd0i I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Apr 2022 08:05:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 08:05:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 08:05:45 -0700
Received: from [10.110.114.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 21 Apr
 2022 08:05:45 -0700
Message-ID: <f5b266eb-1ea8-1fdd-4c78-dac4c5902b1f@quicinc.com>
Date: Thu, 21 Apr 2022 08:05:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 2/2] ath11k: Add support for SAR
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
References: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
 <20220401120948.1312956-3-quic_bqiang@quicinc.com>
 <cb07aa82-2971-69dd-bf80-ff7f0cff4569@quicinc.com>
 <87czhbogpq.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87czhbogpq.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_160553_951912_30EB61EF 
X-CRM114-Status: UNSURE (   9.32  )
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

On 4/20/2022 9:35 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 4/1/2022 5:09 AM, Baochen Qiang wrote:
>>> ath11k assigns ath11k_mac_op_set_bios_sar_specs to ath11k_ops,
>>> and this function is called when user space application
>>> calls NL80211_CMD_SET_SAR_SPECS. ath11k also registers SAR
>>> type and frequency ranges to wiphy so user space can query
>>> SAR capabilities.
>>
>> I find this commit text very confusing since it uses "present simple"
>> tense instead of "imperative" tense so it comes across as describing
>> what the driver did prior to the patch instead of what the driver is
>> supposed to do after the patch is applied.
>>
>> The patch itself LGTM.
> 
> I tried to improve the commit log, please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6b0778eaea60533a8b48df2d890543a48b590f55
> 

LGTM!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
