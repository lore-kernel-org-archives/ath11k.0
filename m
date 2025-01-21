Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF0C0218D
	for <ath11k@archiver.kernel.org>; Tue, 21 Jan 2025 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFyn+vIA68bXfr8/8e+p43567yde9skhLsXNicoGWx8=; b=YqpyW0MEhQp2YYTGRjimobHyd1
	LJOVrQI0xOs2DlsVJuKG/XYPt4ZIKu7blMNeEuL07eidBSc2/VUM7EIVdpw4WZO0i9HMar/13yPhV
	KqW3TeZL41cF2Shrn5Vs9FI2nwUECrTSvBqsOjlgrY5RN5nCm8TyySqgkDLC3gY94L0WJFtw0QAqe
	zYY49LNxvBZBSjEv8YtyqGA5ifKQoZb2FzabhJlU5HuP72mzG2Ao4QSsMFztVungajiU6KXI66DVB
	XrpblhLvTwf2fvPw8L6PYsYad63Nhxgsj060sSphx3XqpUNU27045y+wxc4mGGIPi7SHfeDtiOwog
	EUGMvrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI2a-00000008TSG-1aro;
	Tue, 21 Jan 2025 17:27:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taI1B-00000008TG3-2SD0
	for ath11k@lists.infradead.org;
	Tue, 21 Jan 2025 17:26:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LC2siB021110
	for <ath11k@lists.infradead.org>; Tue, 21 Jan 2025 17:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFyn+vIA68bXfr8/8e+p43567yde9skhLsXNicoGWx8=; b=SkhktG12cJ51tEwz
	f+Wr+gHSZQYIFvBDFIVdam4qEjwYJFoBwkUCp4xrYtGdshP7DN4eX1fLKE3E97GC
	Oj7xzsSacXMGTNuqSrGId4FvZXIbB3Fb/JjhnaaShOr2JeLXuwqpMEfn77fZcLNi
	GAUFN9jpPG6L0Sun4E0rGO/GaL/8io3jf43sufCBAP4wnjtT1LT6MVaf11w+bJ36
	cJcDKXeQYh1qsFV+dtumQTcvx5AAZEf+2jaXv10s9DurbKqhm3Cyksol6zdnXj2T
	of3u5wb7+aK1uSvKvdmMjbBk0Mnkvmswm9zcEpXJd7pWujVlbS06h9Faik83n7VO
	yZsqXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ab888w84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 21 Jan 2025 17:26:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2166855029eso115268575ad.0
        for <ath11k@lists.infradead.org>; Tue, 21 Jan 2025 09:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737480383; x=1738085183;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFyn+vIA68bXfr8/8e+p43567yde9skhLsXNicoGWx8=;
        b=wUbb4hrMS16PY9yJAkWuc38opO7LqPC2wSn6xnhoFCL5dSrWWn9fdaGnvSrj5/OQZP
         DEBhfwrWpYoX4XmN4wkDgkJdwEhPaJQJ2hEa1gxnG3KogWX2z/qdWQpiKOdXSybHKFmw
         zOMqRrwZpG5qXEbgk1efcuMhEcI9bYYRe6Kwe4d8rPzu80dZGcLlZKV0OGMBJRgLp1Nx
         UanaALFPqqKxM4SdIVIQZvYyleTpniLCcg3K7Xl7vkd381EjtFQPEPo47/Xs0Q0FaY1o
         k+Pzkaw1Cn2JYJKLVmb7agTzdCJte/dbqNC4+04PQHY6MNgh2yWFzPKkCrb2gsrLf3QH
         lcsA==
X-Forwarded-Encrypted: i=1; AJvYcCV+B3kqvDge9Ft1HQB6ui0KfPoQeVR0PeGPfV+4NLuRxCEJdZVt08GSmWXMp/wsYjBkCY/1A+s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFhjndEnOw6alY73oY2UgOwE6ulRm5dkXoJQcislJiGisb/Akf
	vzYHngJ0gpKhfWLpOfShPgIZ7QK14rdlzU3BKw44XED7TmYNIjakE5RQPPDkWxkrSFtfTjHXufe
	wHTDamIbO1xhgsEKMqSDNDz5jd6h3XAmW5zZzZjV+KEiEhjWsB4XDmj96fmOy
X-Gm-Gg: ASbGncujw4U3pm+qbkPE60+myaXQCF1PNI6sAMdt4iD9Wfk9OhyNmDGxtpac7zget+R
	IAZ0rwDjJumlJet6YpKruT5N9W9LhSMJZGJADycy2C1ryE+FG/VZhnal9rjmT7xRLRUfw6DCLv7
	6NwRWclRUqLwKlX0VV9bGS67jbTsGQzQHDvwMD9Z8PRNkWBYekHT2FPrlXM2pGx7dja/3K2vVyk
	QKPkZir4OB00Z94jxVnNMKH792qZ9jPynu0ExkyERt7u9nKqRc53ZRskafikdiig02YZKGjcAcP
	YepuYcN+kbzvPq3bphGTVD4H4Y7nSV0wYKGpr/OF9ycY/Vt5ew==
X-Received: by 2002:a17:903:2a88:b0:215:9894:5679 with SMTP id d9443c01a7336-21c34ccef5fmr268666595ad.0.1737480383396;
        Tue, 21 Jan 2025 09:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHebtlpbe2fjGTEr6g5IQsgumqvYjR2tRkHVlpjK0XAFtKdFaHaz7u47zr4G4o0OeZNi4LZCw==
X-Received: by 2002:a17:903:2a88:b0:215:9894:5679 with SMTP id d9443c01a7336-21c34ccef5fmr268666395ad.0.1737480382986;
        Tue, 21 Jan 2025 09:26:22 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcc3232a4sm9137633a12.30.2025.01.21.09.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 09:26:22 -0800 (PST)
Message-ID: <0ab6d084-9fb7-4e8f-b0b7-71812a1492d6@oss.qualcomm.com>
Date: Tue, 21 Jan 2025 09:26:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] wifi: ath12k: Factory test mode support
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Cc: linux-wireless@vger.kernel.org
References: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vr-6nqjddZDAb8AFVeyx2-tHCdaxarPB
X-Proofpoint-GUID: vr-6nqjddZDAb8AFVeyx2-tHCdaxarPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_092625_637021_5CA1F403 
X-CRM114-Status: GOOD (  16.65  )
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

+ath11k list since it is also modified (but no functional change)

On 1/19/2025 12:36 AM, Aaradhana Sahu wrote:
> Device is booted in factory test mode for calibration.
> The commands are sent from userspace application, which
> is sent to firmware using wmi commands. Firmware sends
> the response to driver as wmi events and driver sends
> these events to the application via netlink message.
> 
> Also added changes related to correct pdev id access for
> fw test cmd.
> 
> Aaradhana Sahu (4):
>   wifi: ath: create common testmode_i.h file for ath drivers
>   wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>   wifi: ath12k: add factory test mode support
>   wifi: ath12k: Disable MLO in Factory Test Mode
> 
> ---
> v10:
>   -Combined patch[4/5] with patch[3/5]
> v9:
>   -Rebased on master-pending
> v8:
>   -Included change for assigning seg_hdr.pdev_id.
>   -Moved if block to start of ath12k_core_hw_group_set_mlo_capable()
> v7:
>   -Updated copyright
>   -Moved ath12k_ftm_check in ath12k_core_hw_group_set_mlo_capable()
> v6:
>   -Rebased on ToT
>   -Updated copyright
>   -Added patch[5/5]
> v5:
>   -Updated copyright
>   -Fixed line length within 90 char
> v4:
>   -Rebased on latest ToT
> v3:
>   -Rebased on latest ToT
>   -Updated Tested-on Tag
>   -Removed second parameter of ath12k_core_start()
>   -Updated copyright
> v2:
>   -Rebased on latest ath ToT
> ---
> 
>  drivers/net/wireless/ath/ath11k/testmode.c    |  80 ++--
>  drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>  drivers/net/wireless/ath/ath12k/core.c        |  28 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  11 +
>  drivers/net/wireless/ath/ath12k/debug.h       |   3 +-
>  drivers/net/wireless/ath/ath12k/dp.c          |   5 +-
>  drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>  drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
>  drivers/net/wireless/ath/ath12k/testmode.c    | 395 ++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>  drivers/net/wireless/ath/ath12k/wmi.c         |  41 +-
>  drivers/net/wireless/ath/ath12k/wmi.h         |  23 +-
>  drivers/net/wireless/ath/ath12k/wow.c         |   3 +-
>  .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>  14 files changed, 620 insertions(+), 82 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
> 
> 
> base-commit: 0f5fcb566e7e6c1154540280d334fc71f7cbeb63


