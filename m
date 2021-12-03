Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430C5C433F5
	for <ath11k@archiver.kernel.org>; Fri,  3 Dec 2021 04:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUqr2gPq5YIkeiE8fW6QsySS5jIVHPbk5lez/Mmz0cg=; b=d+g+4qn6FKE9sA
	C9lhlj+6OEC/5dNbZ3CNAVNqgIeh0G7l/KY0jlOViMYHD2oip1kdnq+u+KSmQKE8Ml3UmnHJEHQbY
	GO1HWPZrI+btKRVYTT+lPvbaSHGD14xUZscsRWqiHCy5tTssEByRtKlZj8qcESNLglfFLnJpni/gj
	oIvOW1jN0n2X9u4fJoFe3orUMTe8J7KseXiXfa9ZzgkYH/QMwVlEeE9BF1DPmRfdss0mc9VWI0hMV
	ybFIgGcqhWHFGt6P7NWGT9VN/BTApp3wY6UNgvyLk3mNqeD1z+JOw2NT+p8TUyiTTZwu5eNgkaEx/
	HaQ5flIIPEHgNEbmYubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0X5-00EIuh-5v; Fri, 03 Dec 2021 04:50:51 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0X2-00EItp-K0
 for ath11k@lists.infradead.org; Fri, 03 Dec 2021 04:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638507048; x=1670043048;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Rn6guE8t3ATE79e1Z/gD4ZZpnsVGldU9vizoH3ue/2c=;
 b=elEzBDSIOudFvYs1oI/RcJkBZdw/dJ3orpqHBoU7UBGj5ieqUL6RWLIQ
 jTmSrgofLQEpYW6PhGs7/S2ZX7+6bLlXxZuPfFRJ2bpSdOW8N3DwK5sSi
 SD5WR3Hs3JbmgwSi3PEOLEMbqQOwYQWZWovQldKDO0vKQOE/g8lomCSue 0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Dec 2021 20:50:46 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 20:50:46 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 2 Dec 2021 20:50:45 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 2 Dec 2021
 20:50:44 -0800
Message-ID: <2b017c54-9f2a-ed9d-7593-44663a64bda2@quicinc.com>
Date: Fri, 3 Dec 2021 12:50:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] ath11k: add regdb.bin download for regdb offload
Content-Language: en-US
To: Sven Eckelmann <sven@narfation.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20211202083616.15406-1-quic_wgong@quicinc.com>
 <2715590.fzSe1J7v7S@sven-l14>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <2715590.fzSe1J7v7S@sven-l14>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_205048_745554_8EFEA2C2 
X-CRM114-Status: GOOD (  12.66  )
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

On 12/3/2021 2:36 AM, Sven Eckelmann wrote:
> On Thursday, 2 December 2021 09:36:16 CET Wen Gong wrote:
>> The regdomain is self-managed type for ath11k, the regdomain info is
>> reported from firmware, it is not from wireless regdb. Firmware fetch
>> the regdomain info from board data file before. Currently most of the
>> regdomain info has moved to another file regdb.bin from board data
>> file for some chips such as QCA6390 and WCN6855, so the regdomain info
>> left in board data file is not enough to support the feature which need
>> more reg rules such as 6 GHz LPI, SP and VLP.
> But for the latter, you are also missing the patch to support the
> WMI_REG_CHAN_LIST_CC_EXT_EVENTID (with the 6GHz specific fields in the struct
> wmi_reg_chan_list_cc_ext_event)? Otherwise it should not be possible to
> get the 6GHz reg rules (which you showed in your commit message).
>
> struct wmi_reg_chan_list_cc_event (for WMI_REG_CHAN_LIST_CC_EVENTID) supports
> only 2.4GHz and 5GHz.

WMI_REG_CHAN_LIST_CC_EVENTID also support 6 GHz, But it dose not support
6 GHz LPI, SP and VLP.

I did test with the board-2.bin/m3.bin/amss.bin(without regdb.bin) of this commit
https://github.com/kvalo/ath11k-firmware/commit/0b1d1b2e10f9839ee0675a2ac496bfeb87c304c1.
It only support country US. After added regdb.bin, it support many country.

So regdb.bin is needed now.

>
> Kind regards,
> 	Sven
>
> [1] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/302-ath11k-Add-support-to-parse-new-wmi-event-for-6G-reg.patch?h=NHSS.QSDK.11.4.0.5

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
