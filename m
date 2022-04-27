Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F29C433FE
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYjMp606Se81VxZjT1C7pIYcX+hZV1pAVOVQe6GJg/M=; b=lrNS9BEkD+JbbT
	NtIWhBczaER9zGh7+P9yPHgwSKfJ0RalyfEVRno1j4hEPi87n+1rtJE4xtaeE78+BZV4sz3GCUOHD
	4d0kZo31Ednk+IcgU11ht2hLRp2ssAalQcUEUQAQo3g6ejEq0NRhhoPvxfxfwMl+Ht3dwCQx2jFS6
	PRvCTh12P9z3E5oWvXS+fOxTSvFF48TtetcA8LhqnBFo4j1nmM+wvwXhHpvY3aLKeNM0ToZvb6xHi
	6LSS4PKsJ8KvIymFeoT8koLmjGVgM0SpCNuq0odXhK93v9NJOb+D5K2YT8k8qCqLXkoV35TA2ZuIW
	Z6ZmUTYyk2of4uPjDHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njgGO-001Bks-CC; Wed, 27 Apr 2022 11:55:20 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njgGK-001BkQ-N7
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 11:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651060516; x=1682596516;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZNCiNIQAyV/m3JwZ4wRhFlE2NyRcCwA6zWxfN5c5hCM=;
 b=SXESnswvr0X/pkySicpNS0AQWfE7zdsfO81Uwe6YA/F1JU/Zae+B7HdW
 2ngq7UKKLR5lv89sEZqH3fJl7/D7asGOMUwJdCOhm4W5j+sFtRdjbAu8s
 6xjxMNfJRQ+jfzJ9LTqLNfU/Gvv2vpfwlB7Q+hU7JQytwrz/nkkrhyYbq w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 27 Apr 2022 04:55:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 04:55:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 04:55:14 -0700
Received: from [10.253.39.88] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 04:55:11 -0700
Message-ID: <2dc9e778-b237-8dc7-6b3b-af2308e7084e@quicinc.com>
Date: Wed, 27 Apr 2022 19:55:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [ammarfaizi2-block:kvalo/ath/pending 36/40]
 drivers/net/wireless/ath/ath11k/mac.c:8293 ath11k_mac_op_set_bios_sar_specs()
 warn: variable dereferenced before check 'sar' (see line 8280)
Content-Language: en-US
To: Kalle Valo <quic_kvalo@quicinc.com>, Dan Carpenter
 <dan.carpenter@oracle.com>
CC: <kbuild@lists.01.org>, <lkp@intel.com>, <kbuild-all@lists.01.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <202204182315.h96VPgso-lkp@intel.com> <o5hy1zqhiyh.fsf@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <o5hy1zqhiyh.fsf@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_045516_835590_327EAF8E 
X-CRM114-Status: UNSURE (   6.41  )
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


On 4/27/2022 7:19 PM, Kalle Valo wrote:
> + ath11k list
>
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>
>> tree:   https://github.com/ammarfaizi2/linux-block kvalo/ath/pending
>> head:   c9a8efc35304a89fc0751649945909caf03eeb29
>> commit: 5ad5b356e75f402fec930cf0d77b6c7862850b55 [36/40] ath11k: Add support for SAR
>> config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/archive/20220418/202204182315.h96VPgso-lkp@intel.com/config)
>> compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> New smatch warnings:
>> drivers/net/wireless/ath/ath11k/mac.c:8293 ath11k_mac_op_set_bios_sar_specs() warn: variable dereferenced before check 'sar' (see line 8280)
>>
>> vim +/sar +8293 drivers/net/wireless/ath/ath11k/mac.c
>>
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8276  static int ath11k_mac_op_set_bios_sar_specs(struct ieee80211_hw *hw,
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8277  					    const struct cfg80211_sar_specs *sar)
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8278  {
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8279  	struct ath11k *ar = hw->priv;
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12 @8280  	const struct cfg80211_sar_sub_specs *sspec = sar->sub_specs;
>>                                                                                               ^^^^^^^^^^^^^^
>> Dereference
>>
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8281  	int ret, index;
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8282  	u8 *sar_tbl;
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8283  	u32 i;
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8284
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8285  	mutex_lock(&ar->conf_mutex);
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8286
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8287  	if (!test_bit(WMI_TLV_SERVICE_BIOS_SAR_SUPPORT, ar->ab->wmi_ab.svc_map) ||
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8288  	    !ar->ab->hw_params.bios_sar_capa) {
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8289  		ret = -EOPNOTSUPP;
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8290  		goto exit;
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8291  	}
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12  8292
>> 5ad5b356e75f40 Baochen Qiang 2022-04-12 @8293  	if (!sar || sar->type != NL80211_SAR_TYPE_POWER ||
>>                                                       ^^^
>> Checked too late
> Baochen, please submit a fix for this.

Sure, Kalle. I just sent the fix patch named "ath11k: Fix warning on 
variable 'sar' dereference before check" to internal review.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
