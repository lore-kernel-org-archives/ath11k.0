Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16B7C8303C
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAz8ZIHuo/SWeC7W3wizcPsD4EK5ykNZLoU6WzbK4q8=; b=aDPLFzAomSLtB3loNUOWpkr+Av
	suGHArzYFUn2aiBtHhfgfWurmhPokYJx0Gp6crlI4xFSzVu4Uqk940gbov6uhPojj38yxchhCzv2P
	II1KA7CnOPYO/5cwtuRmz2EVnbSc6Hhzuqo7dukdKGFoq8TB2++q75J1Ie5gEghZTm+KOBnh5jRe8
	ijmbSkwM5jrbCZy7TxX9M4n8Q1grDr82ElrcIyFCDd3JhGfG6QTMisaemqphZVVzQNidCylERtT9q
	0MBt6RZfFzfQT3h7+KMpndM6kFm4FfzxDZCKBtKB3bVXoloDK3k4pnSmCAJLsdH8QhEjyB2BoLnhK
	HSp36vXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5es-000000054yY-3qBm;
	Tue, 08 Jul 2025 10:34:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5Me-000000052Yk-0m3a
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 10:15:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAPPu001219
	for <ath11k@lists.infradead.org>; Tue, 8 Jul 2025 10:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAz8ZIHuo/SWeC7W3wizcPsD4EK5ykNZLoU6WzbK4q8=; b=Z3k1vUVja7wSnnnH
	IketGHiTgcMn3mY3jYohCNO+NLu0OEc70r83fThGNsYDQTR0ehReQXLYWJ8uGIt2
	WmaltGpHUiwLkIAIcNIQG+g67x6KooEIKbNfiHsE2of5ftzRhgUX4ru+7Sah8v0M
	zyvO1FcZ4trf1AvEQLHhcDIZCo+g3H1/uJOvK/edJEF5rB+JFDKm94Gn6BVkVWv/
	4tdYnf6ojHJ+cx3C3ACaoS4BYnU3ozlXQGHxamRdv2Hlk3aAuv4gO2u+g+sBs6uC
	/2vMCceBDTCaZZt15NJziT0oeKr4GQgLUy7aQkUVI5XQ+LP3w5/YIqfCGBSA52O8
	YztW0g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqvwrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 08 Jul 2025 10:15:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso4045383a91.2
        for <ath11k@lists.infradead.org>; Tue, 08 Jul 2025 03:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969749; x=1752574549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAz8ZIHuo/SWeC7W3wizcPsD4EK5ykNZLoU6WzbK4q8=;
        b=jn/jhvpR/ixkD4W5gs89rIN62j0jXz586BVr6rFv8WMhIf8oeywhvqHpDLJ0GL+6Lc
         ox3/U2uamJOZsUhgsarhRGHqOOfMS9cWAlROdijEAiO3nY6E+r2DLydzgluiYCZ/SNPp
         kyRnU0cNW3fGT3Y8AEgOJ8d6tSzN81JHqlojkKVJ7SF2q34JyQvOGyJT5rMLV3+kx/Nl
         S9cNWjTKbfMCk8Jbvhwm5YnMWoIurxfkvTk1WWeapxpHNgLVVzuDHGwOAca5iOfLtL4j
         XV0Yha8OLM8N/bjAQvwdb8ejGM6L3HjLia9U3QULNuVkA8peVtog3KKzp2OW4Z/3MaFm
         GSZA==
X-Forwarded-Encrypted: i=1; AJvYcCVrCENDkrY+YlVcpZRWt6IcxE7uu6bIBPHa5gqfUYHS4QV9kLJwrwQAXA/mrbmN+rSAhl6ooxk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoEtJnJMbp2QPhl5avDDSQICk9FWHq672UcUDu/sPGFaYrDIoI
	IZm+nqn+C+yHTKdvBKVfd+QZOe8EEVGzEdlaIXrw7POSw38qm+85DR/J67e/3AFPbfa8tloYa9g
	Do/wzA9FItcKofj5sbugF76zwISop/ujGnQCNMZi8h5arGGYxzdp3Hrkbbyg6zae7
X-Gm-Gg: ASbGncuyFi+9/cppQmdmorQDAaB7DqmQgO2MOxhZA81mE0MYAKj6ARMfGba+ph3dRy1
	HXqVwehwqm2tcB7nW5OWmtClpKQcJ54t2pwTd+AEh2kRiCj9BsuOfP6QgD7cHlUhvHGWM+VwpCD
	nKDswPkIY2uU0mywEFzHPQCdAs67hA8ZmFwq/TRHVUEGAw//2TMZBU9CzKhpoG4cQBz5eVQKBoj
	Tbz9GyxK1q8WIIc9v/xUYFEJVvK8MA99cAA+WtGj9gnOJkpNPc9MdiY13gyQYcGkWKAN/KEUUpe
	68rttUwSnvBBGzCz2RJU51rjsfl1hGq0YNWKguY1ZZ5BxBaFLUC1
X-Received: by 2002:a17:90a:634a:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-31c21cfbe1dmr2713728a91.13.1751969748730;
        Tue, 08 Jul 2025 03:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxrinOt6UxxB4i1n+mV0391ziMXD2TDdWIyM6jJWyQXxor+uM7US8wRj4S5OLlgpGL8Qo77g==
X-Received: by 2002:a17:90a:634a:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-31c21cfbe1dmr2713703a91.13.1751969748239;
        Tue, 08 Jul 2025 03:15:48 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c21d6797csm1746635a91.14.2025.07.08.03.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:15:47 -0700 (PDT)
Message-ID: <b72b3635-1c09-444f-98f5-30fcc219b297@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:45:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] bus: mhi: keep device context through suspend cycles
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-4-usama.anjum@collabora.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250630074330.253867-4-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686cefd6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=bcI8x_0Kv5OOx9b6aR4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: QZ8qNAdf5upF-bCQ5cMu2L7ILEsToGGB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4NCBTYWx0ZWRfXyS6P08KfM2yU
 ONKArZq9K9rRT4BmmW6LD4TfTKOhA4Lo1nYOTB/+Z8gEYfSKOT4xWFhjy9K3P+2Ga8spTRLAvb6
 hRhNlswgFlmYOxkR8yMShY5+D53w0VvBA7o7hWAjGNuuamhfsQiSB9tsDLLRkiOufbXi4tuiF3C
 wa1pWASULZyt1DV+jrRWcBv1xqlEduEOzndXvs5nrqgxEKrFxvkrKtlWjaQNKvn67i5eb2bzooe
 K6NiXmWsYP8LatB9xcdhgzn5xDJ+aTMO12IA6S30FQ7wzTGGdz/l0470wFx7N8UjKFb8Ud4N4Vc
 paBygs/8/z1PHcgfdB9wVPQXKRrTA+9k/tftEcUHT2Y+w35Y4HiTN+EpEcJt2C4WvdL+UD3o6Zg
 54i/wHs2yetXA1ypXOqVUXw6cZr1IaNw+HcortcvQTtFkKrKHZu6IuNrcB6LxQ2lDkFe6vt1
X-Proofpoint-GUID: QZ8qNAdf5upF-bCQ5cMu2L7ILEsToGGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_031552_356755_4159BBA9 
X-CRM114-Status: GOOD (  19.67  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 6/30/2025 1:13 PM, Muhammad Usama Anjum wrote:
> Don't deinitialize the device context while going into suspend or
> hibernation cycles. Otherwise the resume may fail if at resume time, the
> memory pressure is high and no dma memory is available.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   drivers/bus/mhi/host/init.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 2e0f18c939e68..8f56e73fdc42e 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1133,9 +1133,11 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>   
>   	mutex_lock(&mhi_cntrl->pm_mutex);
>   
> -	ret = mhi_init_dev_ctxt(mhi_cntrl);
mhi init dev ctxt also initializes the ring pointers to base value,
I think we should take care of them also ?

- Krishna Chaitanya.
> -	if (ret)
> -		goto error_dev_ctxt;
> +	if (!mhi_cntrl->mhi_ctxt) {
> +		ret = mhi_init_dev_ctxt(mhi_cntrl);
> +		if (ret)
> +			goto error_dev_ctxt;
> +	}
>   
>   	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
>   	if (ret) {
> @@ -1212,8 +1214,6 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>   {
>   	mhi_cntrl->bhi = NULL;
>   	mhi_cntrl->bhie = NULL;
> -
> -	__mhi_deinit_dev_ctxt(mhi_cntrl);
>   }
>   
>   void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
> @@ -1234,6 +1234,7 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>   	}
>   
>   	mhi_deinit_dev_ctxt(mhi_cntrl);
> +	__mhi_deinit_dev_ctxt(mhi_cntrl);
>   }
>   EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
>   

