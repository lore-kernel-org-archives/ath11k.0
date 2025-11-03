Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFE0CCF9FE
	for <ath11k@archiver.kernel.org>; Mon,  3 Nov 2025 05:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTckRdKzMidJ2PygL42jLXJLkVdQ3oHXT1MYLdik7IQ=; b=MNehH1sneomt3L8fx/889hwk1P
	2l3RaOd9kDKfg0fzJFD2gLYEGmbiPm0TDzTpZwk5vJrtgZFEkgDM8JYmocOfOc8h5Xxr83m32QfHe
	5Zzac6/B68c2QqfqUiXv5u6MFodqa6cmPnGOCzhW2inFVIPffvGdiJKOsaP8SGG27FjZ19A/Poobp
	yt9kSBU7R5a2TiiI6ZOWm866+4XMK2DJ6x5Iv/Qn9ddAoqqkJWyks2j4J7f2AFKLdWt9EL7fHnQuH
	lOxUHG2y5+ker1KNk7L1KiFP/W7o2BpQ3lHn58UyfhzuQ3+7iY3PeC3ecuT1c3HFtq49OGzlCxoW+
	DEZho5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFmyw-00000009Dcz-48mm;
	Mon, 03 Nov 2025 05:19:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFmyu-00000009DcY-0otf
	for ath11k@lists.infradead.org;
	Mon, 03 Nov 2025 05:19:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2MZneL1342496
	for <ath11k@lists.infradead.org>; Mon, 3 Nov 2025 05:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTckRdKzMidJ2PygL42jLXJLkVdQ3oHXT1MYLdik7IQ=; b=hn6tpSqr9bzXpmW5
	Jk90rcIb4bsFS/eEKCLwtwamTtbkvGoG9Xw1PN/zTsYug/3BRKcf//fcA8FXL7wK
	jVUOBPHqYvPmPOAMAQ+X7FONacD+iQ7+pCo7SsHAAQ/G/5Hol0uyVugSP+k0Oap+
	UKgAU6o56aN3rmwcDdd8gVSifWExcOuYhv5b5Uu2XIqS+gZcTWmwBkndmZm/mNCO
	ZFDQt8S26LaMOaWr1JzYzH4+HI3N9bAWLbrHscAqMGAe+ululVtz5DaxXkDTXxz/
	vaNJnlf7iPoXlz50bsJQNCZ8p6A+uAJhDJ3ofXNnyGvpun0vrQqQ7uzjMnHsrvSJ
	ATuB2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6f1tgpef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Nov 2025 05:19:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a43210187cso3696043b3a.3
        for <ath11k@lists.infradead.org>; Sun, 02 Nov 2025 21:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762147190; x=1762751990; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTckRdKzMidJ2PygL42jLXJLkVdQ3oHXT1MYLdik7IQ=;
        b=dM6hdpwothgvvhduuwojmpSPBEnWZGILruQFh0HjR4G15sE5LyQNfDWIqOvwo8g/n7
         pMrg0W2zCGlpEUGfl5WEnmaEdhFKD6+N7eH/uYLuh3CJdDZMmzqi1BVc42bZWj2imR5K
         uV+gkGiufDcIGKnKOhCq8HyRH4AbMeQmVRKU7l7w43eUv4dOk9jm4CcD7Ooe+sdnGUQQ
         ZAoAM6bnjd8G+ti+KGDw/KMQ7pXLDgkQtoEiRKCmoXyxKh5MHUdPBg1V6+4hjzUDUbcd
         KRtKJUeVdabJOj5nb2EyZBkXZTdaf6dC/dhSQ39kjrSYGa6GItF8v3SVyzDsBbwNPx/R
         ZsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762147190; x=1762751990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTckRdKzMidJ2PygL42jLXJLkVdQ3oHXT1MYLdik7IQ=;
        b=UWP/nuGdEkraSuMI+82cVDOWFuaJkETwyMGjmOAW0BOL1LgZzWBZbsK31oFoIA1+ld
         rx/2Ltxy7fKO5Ff89p0htGuGU1FBXQ00LsCef1mCxVGMMibuOS+y3sVbvbpoq/6kb3CM
         eAN1uivTSSK6ZmXhshWquC4x/qfmOOrw4QXib8wBv7hJd490hJrgTSo6qnKNUpv9w8qM
         I7Z31RobK53e+Gn/8TSg0fbySUIQ9WTevMKmnQc1O9c2V7G9IVxblPdy34FILEMrmOYK
         Y+WiAsVgvuh96gqCAq7GlD4nx8X5DIzZHfmsaroYtDWeBCHAkVPTvpt3uaIS2OZ5Y2Gy
         Z1lA==
X-Gm-Message-State: AOJu0YxT8LmsEuZkXvzPY8cuGP605IzK74iVuycUzb7FmNETmOWivUbQ
	TSygUP/awOclTQXWVZKP0p8L5JOb4EfgqaTcEd398CXXM7CHB2UIVZpcd6ZZ3HI+EQtTv6fh3kw
	P95eIOBKNkwld9N79Nb7+kJ42D5KN0EHuw5oBVK832EninEIxjlJbyQIFh9a2pLw1YIBLYjI3
X-Gm-Gg: ASbGncudA1dAffJ3RRk8KB8oSKduEJYL64i0IrVXBKQutTpzaN+85rIbWrgWrkvPfNb
	UWu6POVEay/O9+w0rXyFtbQpILx/CV0mjdl1H5xMBgAAXcdNJQ4X3X6wm10Ml3dJ8Ijee5KZpFp
	zvA+h31swWKxtgMRCnPmLmG4kk4kA7qBHUxH5sJqO1bzXB5BIUC5/BJYxiavbdvNwIvHC8ywohZ
	zHU8cMg96JGexyt0m8JWX6mcpyKnq7XerxSfg0nJ2Wyr7YZAi2HwPH8V8i1/06TGDe4l3QCzeCl
	Lbr0uJYyW20sVkRgPgaK7C/Oo1GdiVBpK9ymjqOtT+3DNbWkkQ7LePnKrmBIj4ynC7WwKhVKitq
	LS1thzFspz+pmB4+XJ0kk1wmh5m+G/gjnMQxMgFPYLSbc
X-Received: by 2002:aa7:874c:0:b0:7a9:c21a:5599 with SMTP id d2e1a72fcca58-7a9c21a57e1mr4637686b3a.4.1762147189809;
        Sun, 02 Nov 2025 21:19:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY6CK7+3qnqtgym8dPplUFumkBERSWgzc9iw1hh13q+kTrQoOQdgsQ/U1226mL1FUfV348Rw==
X-Received: by 2002:aa7:874c:0:b0:7a9:c21a:5599 with SMTP id d2e1a72fcca58-7a9c21a57e1mr4637669b3a.4.1762147189328;
        Sun, 02 Nov 2025 21:19:49 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a9ea1159e1sm4418212b3a.23.2025.11.02.21.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 21:19:49 -0800 (PST)
Message-ID: <f66b58d5-a952-62a7-fa2b-0b15484f2bb8@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 10:49:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: ath11k: question about memory-region
Content-Language: en-US
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <aLf825sx7W2S4Hlx@FUE-ALEWI-WINX>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <aLf825sx7W2S4Hlx@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA0NyBTYWx0ZWRfX8bP1Myt4iu/a
 ZTFRadlaXJRqMjIs8hguN/n63quYlyUbfnggKFQN4Tfl1RodV3C1xEmqvIwp2IxTI8xXY3a2wI8
 CzZaFDl1cc25HKze77cqXMu2yYIyGMHwRvCEP+I/DFlUGl2kxA+/K7z2buXhvqYMp6UMDTzqs9e
 fV/KLgTa+aiQJO9V0r4yuz9TTm0pELBsjf9WX9MogV/dIkqPG039hJsBzHqgWTdILYhhDbfQNjw
 J5DX5xSsYdmjlS8994XPvB6LuMrLi/BRwuYlflREhae/4lY4a8K0t9PxmzOHSHapGCPMKgK1ZM5
 U7kMLF+6x322Zx0miI4LH8RKMBcx0zjCiKD0v+clkg4DDSCTxczeLwgZC9sUPy/dgjkzt8cBUHI
 73ja8td1M/1ND+QJVG4ZUl32Ny/3IA==
X-Proofpoint-GUID: 8_4raCSJX3hXGNaiPjhGCZzDh2ErI7H6
X-Authority-Analysis: v=2.4 cv=WZkBqkhX c=1 sm=1 tr=0 ts=69083b77 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=TdGNnazd7jbYejwxrHYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 8_4raCSJX3hXGNaiPjhGCZzDh2ErI7H6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_211952_267288_D5DBE37F 
X-CRM114-Status: GOOD (  14.72  )
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



On 9/3/2025 2:01 PM, Alexander Wilhelm wrote:
> Hello devs,
> 
> I have a question regarding the use of memory-region on a platform without CMA
> support. Since CMA is not available, the driver allocates many smaller memory
> chunks instead.
> 
> To evaluate an alternative, I defined a node within reserved-memory in the
> device tree. However, this led to a firmware crash:
> 
>      ath11k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>      ath11k_pci 0001:01:00.0: boot pci_mem 0x10b272d0
>      ath11k_pci 0001:01:00.0: boot pci probe 17cb:1104 17cb:1104
>      ath11k_pci 0001:01:00.0: pci request one msi vector
>      ath11k_pci 0001:01:00.0: MSI vectors: 1
>      ath11k_pci 0001:01:00.0: pci msi base data is 0
>      ath11k_pci 0001:01:00.0: qcn9074 hw1.0
>      ath11k_pci 0001:01:00.0: FW memory mode: 0
>      ath11k_pci 0001:01:00.0: boot failed to load firmware-2.bin: -2
>      ath11k_pci 0001:01:00.0: boot using fw api 1
>      ath11k_pci 0001:01:00.0: pci msi assignment MHI num_vectors 3 user_base_data 0 base_vector 0
>      ath11k_pci 0001:01:00.0: pci num_vectors 3 base_vector 0
>      ath11k_pci 0001:01:00.0: pci msi assignment CE num_vectors 1 user_base_data 0 base_vector 0
>      ath11k_pci 0001:01:00.0: pci msi assignment DP num_vectors 1 user_base_data 0 base_vector 0
>      ath11k_pci 0001:01:00.0: pci irq 18 group 0
>      ath11k_pci 0001:01:00.0: pci irq 18 group 1
>      ath11k_pci 0001:01:00.0: pci irq 18 group 2
>      ath11k_pci 0001:01:00.0: pci irq 18 group 3
>      ath11k_pci 0001:01:00.0: pci irq 18 group 4
>      ath11k_pci 0001:01:00.0: pci irq 18 group 5
>      ath11k_pci 0001:01:00.0: pci irq 18 group 6
>      ath11k_pci 0001:01:00.0: pci irq 18 group 7
>      ath11k_pci 0001:01:00.0: pci after request_irq msi_ep_base_data 0
>      ath11k_pci 0001:01:00.0: pci ltssm 0x111
>      ath11k_pci 0001:01:00.0: pci pcie_hot_rst 0x11
>      ath11k_pci 0001:01:00.0: pci pcie_q6_cookie_addr 0x0
>      ath11k_pci 0001:01:00.0: pci wlaon_warm_sw_entry 0x0
>      ath11k_pci 0001:01:00.0: pci wlaon_warm_sw_entry 0x0
>      ath11k_pci 0001:01:00.0: pci soc reset cause 0
>      ath11k_pci 0001:01:00.0: pci mhistatus 0xff04
>      ath11k_pci 0001:01:00.0: pci link_ctl 0x0000 L0s 0 L1 0
>      ath11k_pci 0001:01:00.0: pci pci reg 0x3164 instance_id 0x11 read val 0x11
>      ath11k_pci 0001:01:00.0: boot notify status reason UNKNOWN
>      ath11k_pci 0001:01:00.0: boot notify status reason MHI_CB_EE_MISSION_MODE
>      ath11k_pci 0001:01:00.0: qmi wifi fw qmi service connected
>      ath11k_pci 0001:01:00.0: qmi indication register request
>      ath11k_pci 0001:01:00.0: qmi host cap request
>      ath11k_pci 0001:01:00.0: qmi firmware request memory request
>      ath11k_pci 0001:01:00.0: qmi mem seg type 1 size 36700160
>      ath11k_pci 0001:01:00.0: qmi mem seg type 4 size 3784704
>      ath11k_pci 0001:01:00.0: qmi mem seg type 3 size 1048576
>      ath11k_pci 0001:01:00.0: qmi mem seg type 9 size 8388608
>      ath11k_pci 0001:01:00.0: qmi mem seg type 10 size 8192
>      ath11k_pci 0001:01:00.0: qmi ignore invalid mem req type 3
>      ath11k_pci 0001:01:00.0: qmi ignore invalid mem req type 9
>      ath11k_pci 0001:01:00.0: qmi ignore invalid mem req type 10
>      ath11k_pci 0001:01:00.0: qmi req mem_seg[0] 0x0000000040000000 36700160 1
>      ath11k_pci 0001:01:00.0: qmi req mem_seg[1] 0x0000000000000000 3784704 4
>      ath11k_pci 0001:01:00.0: qmi respond memory request delayed 0
>      ath11k_pci 0001:01:00.0: boot notify status reason MHI_CB_EE_RDDM
>      ath11k_pci 0001:01:00.0: firmware crashed: MHI_CB_EE_RDDM
>      ath11k_pci 0001:01:00.0: ignore reset dev flags 0x2000
>      ath11k_pci 0001:01:00.0: failed to wait qmi memory request: -110
>      ath11k_pci 0001:01:00.0: qmi failed to respond fw mem req: -110
> 
> Why is `CALDB_MEM_REGION_TYPE` always set to physical address 0?

Coldboot cal is disabled for qcn9074.

> Could the crash be caused by platform-specific constraints and not the firmware/driver?

Hard to say. At least from WLAN side there is no known issues when using reserved-memory. 
Can you share your reserved memory node?

> Does it make sense at all to use reserved-memory instead of small memory chunks, for
> example in terms of performance?

There will not be any visible performance differences between reserved-memory and
small memory chunks.

Vasanth

