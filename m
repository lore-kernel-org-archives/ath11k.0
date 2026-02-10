Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447A8EB26ED
	for <ath11k@archiver.kernel.org>; Tue, 10 Feb 2026 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QA9pHi2J3cx2uUp8Toi2s81kS4xpkoxIS2NhUlEh+B4=; b=ZnWVEfqfkuSYO7LE4ml94D8ykZ
	M+sID6G3BOkl40Ct8FHmhI/aF6MfVKWLLK7v25+zgA12H/vtIWD9GJvOqL6SADHIZ7LF90cal2VfJ
	pKSIkzz4QBVVn7hMMVC9bnN1/nS9VAjKvA91XeIEXZRbAF1XblaXb0vJoonHn3CBltVJ4RYRE5beK
	aR3xxrHjIBbSUNKJVXjuKzu8JJCa2iosZCD7SFd2XY163dXI1hWH3ZCZwRo1tAfJQAZugQQqSjJ2X
	h8h9FKYpINV6GNCnW+6D2o31Oyn13G2qs6Brvx8xF4wek5a/43TR+ENQsOrF544B8IoDlVGf5YuLs
	xDeW2S0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprFU-0000000HKAP-4AlL;
	Tue, 10 Feb 2026 17:10:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprFS-0000000HK9S-2wVu
	for ath11k@lists.infradead.org;
	Tue, 10 Feb 2026 17:10:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AF1DUC4003532
	for <ath11k@lists.infradead.org>; Tue, 10 Feb 2026 17:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QA9pHi2J3cx2uUp8Toi2s81kS4xpkoxIS2NhUlEh+B4=; b=d7U7wFd+9jhDN5ft
	aLJnsazJfr5fDzHOKmM70AgrQ+SNM7u60WSrAJ2f2oT6+MIW89VgyiHHoh5ezuLk
	fasEjj2zBiOkZMWIkl9zfdTMJrBpa998pGPGMYqwg7sVMzmcOwQNIHm9xQKNJz7o
	daSiGdFyroOd5v82v0FL8Bqb2wOMmrUs/GtA7JcgLkouGku5jk0Hu55Oh4fdQuAw
	sRJr1/0bjX+GBqf/uOr/9JcjmxxzJokuOen4p7TZsl8f3hiEdmGH9GIFUKTkTP0D
	dGB2/8I3Pl/RVxewNrUJXcqv69kZGYNyL4s5FhM5P1elI6K+wRIy0a340Dg74CdQ
	6CUj+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7r23kf22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Feb 2026 17:10:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aaeafeadbcso29180265ad.1
        for <ath11k@lists.infradead.org>; Tue, 10 Feb 2026 09:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770743401; x=1771348201; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QA9pHi2J3cx2uUp8Toi2s81kS4xpkoxIS2NhUlEh+B4=;
        b=VeJvLPkpOZIL8+TuPoxeaHjfGT3QnL2uETClb57nm4Cj5tao1lkdQYX9Wer1Fd5nIP
         wkP2oKMAZDcW9oDJOuMdmxQjNTjr8d8XAXk2sI88bbVe9gh3gu+7za756coKFSba2S8i
         k+dKp7Uqa3V6S8o1KDS/cw41HJMrOIDfiLyObeXFZp0N0fL6IJxKVpKyiNO5YfLYH4fL
         cyD1u6GDvp9wgLl67mXE4E/W7/9f8vssMGGsaT7rdc2Szy/SzxDN6rudsHvuO2av+nY4
         y5H0yQ9rDhtuyVMKTrEZW4J6nQ2xVPK/hzFnthuYZbsCv98VmZmI1z+13JqmsqgHRoX6
         RbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770743401; x=1771348201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA9pHi2J3cx2uUp8Toi2s81kS4xpkoxIS2NhUlEh+B4=;
        b=sEORD2t9uLABBGm06Fuw0D1PEpYxen4isv9m9QzxPqgSK9LLS2WcRgGNrLNuoF325+
         lcP2D+66DpYFZxbewNgFIktwyXf4gHjMhNbSUwMOm1/Ihii8WlPgQYKhRODJsFvEInDJ
         8XK4ZaJauIogIf/UWByXzC3WIBXYQvkf7HK7c4p45fGEn/vk9WiZW39TE5wO+cdVGStw
         YSAWxLkSfiQCC3k0eUnVjvxjdMvu7tLetgWsm7R9C1iohgaHJDi9Zr/gpiAVlmc0DsLL
         V/57O5p1J8J/cP9OtFiZh/kT10eX2028tYJFLYLIN447aT7O55/6wQpuZFYCh07dNnlu
         nsCg==
X-Forwarded-Encrypted: i=1; AJvYcCUwL4x3WAL5vvUPEgMgg1lAi/UoJYGVDFj/K5JRLT0i73vjHb/tNh9kPK3CLRg76snTUO2oy9s=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGdhxym3h+YBWokXTzw5XbKLAR/fwx0O8Px8Bo+MDZM2lXjZNf
	kT16prZgSpUl5+S9IrurtHSaxdQQalYi2rgOAVD1eqMWjXiaXoQNJIhN8gaavKe8PclZ6bMpfPS
	6XjGVlUKus4/PBbvPbecSlVbTcMexH4D5sDery/UzgiIbH6CcPVDWp1XYKkq2XFSl
X-Gm-Gg: AZuq6aK2X83g55ibQjPMsrl59HnRk8POgNZDg4uN0Pwqho+H+DzRVVZJgheLYMMk/H4
	LkiKw0Y22Wm7HOceqqXxdzpKIZFYh2ux5G110tM5kGjdLf9YOdKCW0B/MsYm6wIFQ+xPh+Tz0mV
	H11uBTSBCpWS7hK+/qTXMVrCUF/YvEMMIYM+Z0IazN0is5jau6mj+hzE4Oz+bqtTwo8I3msYozG
	Zijh/CeXlbXyoLZYhaX21CWTjehc25W17hbIxHVkCTbmeVa8uiNr6Ppja8EwNvtEHvDli5JAvpU
	uxRwZWy1pyG0kHUN4QvJgqXmfHz2ahOj/teFe5w/PIAupw+JN9CpQYGX6ZCAFtFy8uPVb0s9P5y
	vIep5rSczu9W2/63MizVwpeexCeX5KmsX4ngLFDx5t6+lRbTC8w8N8bEMeMwtdPfhiUfM3IEp
X-Received: by 2002:a17:902:ea0e:b0:2aa:f9d7:68aa with SMTP id d9443c01a7336-2ab1033cafemr34211175ad.21.1770743401215;
        Tue, 10 Feb 2026 09:10:01 -0800 (PST)
X-Received: by 2002:a17:902:ea0e:b0:2aa:f9d7:68aa with SMTP id d9443c01a7336-2ab1033cafemr34210875ad.21.1770743400628;
        Tue, 10 Feb 2026 09:10:00 -0800 (PST)
Received: from [192.168.225.142] ([157.49.96.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aad5fd6ae3sm99148505ad.6.2026.02.10.09.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 09:10:00 -0800 (PST)
Message-ID: <88fbbb46-0f2a-459e-8dff-2a7679e1ffd4@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 22:39:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ath11k: add ath11k_mac_op_flush_sta to properly flush
 pending packets
To: Florian Maurer <f.maurer@outlook.de>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <GV1P250MB14333A5BF24623C4753A10E1E8E0A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <GV1P250MB14333A5BF24623C4753A10E1E8E0A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE0MCBTYWx0ZWRfX4KrA1/kbh5gr
 aR/gzwtdPx93TSirCw4utC24JIq6LXA6DlZ10tfgWrgdVzbS+EfEOAUvw0ujf2QqqprM3B11ZcE
 qXgjaTrXjakncsQ3JgPyQsvpiSd0exN0V3k/NYbLq7/+DOx4ynQuDbDAyU9K66yXvnWq5OPKtaZ
 YgQm1Fip5EQeDFeuvF6g8Dg/5ScM86rfNU/oIrSoURs+NhmT6slLt2bzcKV3jWlRdrM0JYlIwyw
 /cppnbjvAF9ZZ1D+ygrpDaD8pcTa0weSv4zH6jhjk7cSyS9IK9lr76NxSE3LfWqs75joDG8Fh3J
 sQOEYYSyQOM7FXF/OctRYtif/NvMbSW6rf4+gxpjTEHeWrX69BV2dSa7sCYDAuc0jIAgHTddZhU
 e6Bz164285RToTQZtw1gRl9dsJrRNv38L4F5xz620Y4amjpoLlHGsEX4V5Ao0eVvZwiagAgsmcs
 MiFhPtMNJh2Th351iOw==
X-Authority-Analysis: v=2.4 cv=MLRtWcZl c=1 sm=1 tr=0 ts=698b6669 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=B/w2FSjaSvn+sk5eEndylg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=stkexhm8AAAA:8 a=brv3kHFulVQmvlGtmkoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-ORIG-GUID: 2DCh_9yzFpsp8OnA-LfQtFsuVyy4EZzy
X-Proofpoint-GUID: 2DCh_9yzFpsp8OnA-LfQtFsuVyy4EZzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_091002_762408_01238103 
X-CRM114-Status: GOOD (  26.30  )
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



On 10/7/2025 1:41 PM, Florian Maurer wrote:
> When a STA is marked as no longer authorized, if the driver doesn't
> implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
> flush hardware queues to avoid sending unencrypted frames.
> 
> This has became a problem for ath11k because ieee80211_flush_queues()
> will stop all traffic and call ath11k_flush, which waits until the
> whole HW queue is empty. In a busy environment this will trigger a
> timeout warning and stalls other STAs.
> 
> Fix this by implementing flush_sta method using WMI command to flush
> frames of a specific STA.
> Flushed frames will be marked as discard in tx complete indication.
> 
> warning print "ath11k c000000.wifi: failed to flush transmit queue 0"
> was observed on various openwrt devices, and is fixed through this patch.
> 
> Signed-off-by: Florian Maurer <f.maurer@outlook.de>
> Tested-by: Florian Maurer  <f.maurer@outlook.de>
> Co-authored-by: Benjamin Berg <benjamin@sipsolutions.net>
> Tested-by: Flole <flole@flole.de>
> ---
> We tested this patch and it solved the problem of flushing the transmit
> queues taking too long when the AP is busy.
> We did not confirm if this flush is implemented to guarantee that no
> unencrypted frames are sent out on station removal.
> Could someone with more knowledge about the firmware behavior check
> wether this approach is feasible or if a different approach should be
> taken.
> It is not clear to me if the approach taken in "wifi: ath10k: Flush
> only requested txq in ath10k_flush()" might be better.
> https://lore.kernel.org/linux-wireless/01d859e8e574a1f5d0b916333fe0b5cda859af9b.1732293922.git.repk@triplefau.lt/
> 
> Regards
> Florian
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 106e2530b64e..a94649edd4ed 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -8330,6 +8330,24 @@ static void ath11k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
>   	ath11k_mac_flush_tx_complete(ar);
>   }
>   
> +static void ath11k_mac_op_flush_sta(struct ieee80211_hw *hw,
> +							struct ieee80211_vif *vif,
> +			    			struct ieee80211_sta *sta)
> +{
> +	struct ath11k_vif *arvif = (void *)vif->drv_priv;
> +	struct ath11k *ar = hw->priv;
> +	struct peer_flush_params params = {
> +		.peer_tid_bitmap = 0xFF,

The recommendation from the firmware developers is that all 32-bit has to be sent
in WMI_PEER_FLUSH_TIDS_CMDID for both AP and STA mode, otherwise some of the tid
queues may still have pending packets. Firmware does the intersection and gracefully
ignores the inactive tid queues when all the bits are set. We may need to check the
firmware crash dump to understand the issue with 0xffffffff bitmap.

Vasanth

