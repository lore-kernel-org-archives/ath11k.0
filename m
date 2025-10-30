Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412C8CCF9F0
	for <ath11k@archiver.kernel.org>; Thu, 30 Oct 2025 18:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukOAiwegom4AE2DEzGWyvCrTZUu6l9n/cjr5gBCddxQ=; b=N1XZQfqkn1rcySgHtGePLDuEYE
	fP63FHdLbF+rCjmep9/qWROFiVS/Q7BPScn8UFNXlYo5Jp1AtLIiXa9vnFTEiIIBRstBxOETVp8If
	4ChhG89XObXu/d0WX7yh+JtBAKho+tZpBeYHoXzrdc4XoWbakqG9AEuLGY6aGHAK1KSCk7WfjiLRF
	mfN5rYdHEhS4WN9YHqbSs0YTEEfDjX4L6fuIbSk3Ig4WQyv1e5CzktcX+zzIETEG/XOdR6tO7GMvT
	sAUvAX5Ktm8OtpZjtvc82NTW9QAfXJtqcfjcObMtMUtqMumJ5RXGBMrYCICi+owAz/t5n1m85je1A
	JBGr2G0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXD4-00000004aWE-2rIF;
	Thu, 30 Oct 2025 18:17:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXD1-00000004aVl-13re
	for ath11k@lists.infradead.org;
	Thu, 30 Oct 2025 18:17:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFXiWY1599121
	for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 18:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukOAiwegom4AE2DEzGWyvCrTZUu6l9n/cjr5gBCddxQ=; b=CsJLpYV65PXyyhOW
	stK5fWK5ToutD6M5bdb0sn6ErWtTB7MZ4ojsH8d/38UtqQPcujj7WVDgLmG/h07X
	8ybW1fOj7hXBQNDksBbJH0byMlxyoeGUK8JYBTh8gmL6Hwxrk5VYT6KtMP83e1f9
	9OmIKmq3+LalMUeLDd//R/quGXGmRoTxGQZHQFqNLHIA2cW448QBlp93+pRp3z9C
	AotsvEB7NQwCgNf4Hogb+oKi0vrdM0V5BhbgJDz2T2SSmY65UKyk9CK0O5ExPcDO
	o37aysexbFrO4aZhLYOh9i33xRTQ9TiRQ6Xwvdl4HqZ/iasEWXMsszVN9rR/D0St
	I2iCZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ta7uef2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 18:17:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-294fb13f80cso7971185ad.2
        for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761848233; x=1762453033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukOAiwegom4AE2DEzGWyvCrTZUu6l9n/cjr5gBCddxQ=;
        b=HvJM1UETOgpJMqmqp4TzmoIVTD32BANfScQvuJCofwb+gfhYI00fUjKjMSdTFPQCZv
         KJ3Z5SN8VB8laMCIwpx2yyM+zvWlqSsEEgknaBmfWNmwGVr40GGkHQdekuG+7LxtLCb+
         9ja1hQLxgRwNrDLyrN1GH270VtSETzhTTbEN7k1ZVns23qYn1zGUouc15HFQkNKpln0M
         WWV5uonUiD+9byL6ugOfU01sz+2JV+m82aYodXk4Y0QaiP5Ck3OIT5GiAHnK+DYpmN84
         MWrYlap6vSBVXFsiJQ78YXNK4y5T4P54X9gFYPQmTHo1JxlC+hBM/OXoXRW3AYdmNhlU
         7cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848233; x=1762453033;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukOAiwegom4AE2DEzGWyvCrTZUu6l9n/cjr5gBCddxQ=;
        b=Pbfo+fxK+9sWlYOt5mFCMy96+/cP8jR/F2QElrdOles6pjyQyVsPmh01C1oCnztjn4
         uGr5vl6IgBs8DRKYHIuH019C1oX0t5lU80J1/7nmX3oCfDlwj39vma8RWS7kSNV4WjFd
         NvJUUoG3yN5c2Jj9FeeAXYW2rIcB1j3rkh0w2LoFltktZCmZ8BNvJNfw6VVvdVBLIAhh
         hlYGK2JwfIFWfl/2OQLF6XvDvOxk8zNtVYX29rLq6Q5Mk9uwrCynZELQMsXU5zbgiMKg
         U7qUWadGSCCd3AheRjSuvEHPPB2i7+n/xSUV3vIpAc31ftoDp/+LkVSGisKYhbaP2ev1
         pCEw==
X-Forwarded-Encrypted: i=1; AJvYcCWGbpcFcFr4UfrmoBQrLJv5VKA5uUS8IvbSxv9H5rtGW6JDFbcU2O0g7w11O2W36hh2ZbU5Y00=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn9QNK5XvNBsReGtbcVUToC8g1E/pZBqYHn36L7ON9Tvkgb6CM
	47JMNvD0Vu0tahwdl5eUJKIgP7lZ8XOzKuvCP6AJknibBPbR3uLcFOgt6x4E/OKRCUzGjJEaF7j
	YL91AvuYKgkI1kwX6w3Gb53xhl9Kihvf5CDz7FmMAAmWiYsznIo5lPOlu6rLIGr5S
X-Gm-Gg: ASbGncsmKeA21SmoyY4rNeImE4c+Sjvx6kTWQqG/Hmzc+fcOVPWkUryyyT+ort7e83Y
	ulni0n46u8RWZvNSWHrTn5LQ7U4WaX3DGQdfb6JsNi4g4HZSt58u1oD0/Toxi6kqlqhK9UprO66
	yV1S/x3vsjStZoaPE2yfvlZaHlyY5V6eipIoMqzc7yqfT0mmv45wE19ga1c1V41ZOjcKWxi3CAs
	LxFdh3vTUtu075V0DS4zcKwawO0Kw1YLhaZl5Kw1c2u3NQC3YwQvmmC2nAR/krvSr8r9rGKaL9T
	K5cZjXZ2WdvsDqES4mi+NGkTe5OPGgZHoUpFFE/Dq7darrFSqRWSZ8L6Bm/r9cfPo+kMyexiPkS
	aFFRgY2KYRSFWdA4XiB4AM4TZ9L4XgQIuz85UaxGZuwyO6148Bzo=
X-Received: by 2002:a17:903:3c23:b0:294:7048:643 with SMTP id d9443c01a7336-2951a3981fcmr9783655ad.15.1761848232667;
        Thu, 30 Oct 2025 11:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLtTmQxZPJXadN3yxRt1WMDsinLARvPN+Zc4Ke3Ur2NA0AUQYwVjva0B1WQ9P3HPSMFkp6xA==
X-Received: by 2002:a17:903:3c23:b0:294:7048:643 with SMTP id d9443c01a7336-2951a3981fcmr9783085ad.15.1761848232055;
        Thu, 30 Oct 2025 11:17:12 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.207.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4b0csm192683585ad.10.2025.10.30.11.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 11:17:11 -0700 (PDT)
Message-ID: <3a06ddc1-39ad-1192-e44b-0dbaa1352f76@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 23:47:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next 0/6] wifi: ath11k: Add single shot/periodic CFR
 capture support
Content-Language: en-US
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaVsXBot c=1 sm=1 tr=0 ts=6903aba9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=CMr6UP9dfYAYc02HN5pMZg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=dwuvWDSKMyNAM4JwnMMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sa7ADKHJGW1_Bp84LCL3pbzAnLF53U6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MiBTYWx0ZWRfX6AUZ4cOIDor9
 9P3K3sMZ2WnGt41MjiTbmJFPpiHXUcwTgN7qf+TvA0TN2sWD5B/SWq8UBGYa4/1TPLu2wKnLWcB
 ZsisnLvCL1s9dHsyygyGzECVgYxsFmRTk4ZlDIlUDldZlN3bhVovFrzQirXiPjUYqBk+xZ6MoaK
 TPtdPHZgz3K1bKoCD27ft9v6Bh6fG2ALEBVFQTgRVclhuX2asqiFIymNqr7buyG+IVc742elPCf
 42Z22QwfNpnZsUWQe8gnciJuj+4uk2X5yPyn9pbxFYeQcsItSAsZQTKyO8abpDXOgy/mM2Jvudb
 5bumGCYpf1kNVAqiUG6zx+uXAngxFTFq2Jl/wwvwNnALzuiAQu0+vJqPIfuP5k/OOl2ik0uWe+I
 k5SOK5KJFXKea15o1v7MdMtfCZZZKw==
X-Proofpoint-GUID: sa7ADKHJGW1_Bp84LCL3pbzAnLF53U6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_111715_434144_F99F1DC3 
X-CRM114-Status: GOOD (  13.66  )
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



On 10/30/2025 10:01 AM, Yu Zhang(Yuriy) wrote:
> To enable/disable cfr feature use command,
> 
> echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr
> 
> where, val: 0 to disable CFR and 1 to enable CFR.
> 
> To enable CFR capture for associated peers,
> 
> echo "<val> <bw> <periodicity> <method>"
>   >
> /sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture
> 
> val: 0 - stop CFR capture
>       1 - start CFR capture
> bw: CFR capture bandwidth
>       0 - 20MHZ
>       1 - 40MHZ
>       2 - 80MHZ
> Periodicity: Periodicity at which hardware is expceted to collect CFR
> dump.
>       0 - single shot capture.
>       non zero - for Periodic captures (value should be multiple of 10
> ms)
> method: Method used by hardware to collect the CFR dump.
>       0 - from the ACKs of QOS NULL packets.
> 
> To enable CFR capture for unassociated clients,
> 
> echo “<mac address> <val> <periodicity>”
>   > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc
> 
> Mac address: mac address of the client.
> Val: 0 - start CFR capture
>       1 – stop CFR capture
> Periodicity: Periodicity at which hardware is expceted to collect CFR
> dump.
>       0 - single shot capture.
>       non zero - for Periodic captures (value should be multiple of 10
> ms)
> 
> To collect the cfr dump,
> cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin
> 
> Previous link:
> https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com/
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> ---
> Venkateswara Naralasetty (6):
>    wifi: ath11k: Add initialization and deinitialization sequence for CFR
>      module
>    wifi: ath11k: Register debugfs for CFR configuration
>    wifi: ath11k: Add support unassociated client CFR
>    wifi: ath11k: Register relayfs entries for CFR dump
>    wifi: ath11k: Register DBR event handler for CFR data
>    wifi: ath11k: Register handler for CFR capture event
> 
>   drivers/net/wireless/ath/ath11k/Kconfig       |  11 +
>   drivers/net/wireless/ath/ath11k/Makefile      |   1 +
>   drivers/net/wireless/ath/ath11k/cfr.c         | 991 ++++++++++++++++++
>   drivers/net/wireless/ath/ath11k/cfr.h         | 301 ++++++
>   drivers/net/wireless/ath/ath11k/core.c        |  41 +-
>   drivers/net/wireless/ath/ath11k/core.h        |  19 +-
>   drivers/net/wireless/ath/ath11k/dbring.c      |  50 +-
>   drivers/net/wireless/ath/ath11k/dbring.h      |   8 +-
>   drivers/net/wireless/ath/ath11k/debug.h       |   8 +-
>   drivers/net/wireless/ath/ath11k/debugfs_sta.c | 143 ++-
>   drivers/net/wireless/ath/ath11k/hal.c         |   3 +-
>   drivers/net/wireless/ath/ath11k/hw.h          |   5 +-
>   drivers/net/wireless/ath/ath11k/mac.c         |  17 +-
>   drivers/net/wireless/ath/ath11k/wmi.c         | 147 ++-
>   drivers/net/wireless/ath/ath11k/wmi.h         |  97 +-
>   15 files changed, 1816 insertions(+), 26 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
>   create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

