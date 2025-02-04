Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F876C02193
	for <ath11k@archiver.kernel.org>; Tue,  4 Feb 2025 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93FHj3TQtDW6kBe7tNjNj9/Gx/ttkR4OUn4cjKP3MWM=; b=09bR08Pe5CABGoSWJw4P8jV652
	97yYty7m3CFCm9Tx/ceAQdpsVcs9kwGFnlv9C/SwSsfqnxmdRb/ufmo0Ppir7PQIWVnFREQS6hzJZ
	Vt9hSccrcIBpJPCMDj9C5+WvHEY+8bunOp7m6iiYv8fbkXKLXceafnyySldGRltqBXj4HzrWo+0gW
	khZOBmKPXdqOH59qeXyDXAEyzAcEJUZIoJ+ECpqIyqoQocg/ntCMzINiDcRbnxxvtkPCKqyPL+9t8
	0P9nEgBAggiX+Xn75VoYCYmsa/PZt5EKzZL+ZRqpN68elt3QYi/z7Prpl8ZovHf7MEOkk4F/+DvYo
	wtGuPEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMTu-0000000142z-0d7S;
	Tue, 04 Feb 2025 17:13:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMSj-000000013tg-36DV
	for ath11k@lists.infradead.org;
	Tue, 04 Feb 2025 17:11:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5149sfGf005794
	for <ath11k@lists.infradead.org>; Tue, 4 Feb 2025 17:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93FHj3TQtDW6kBe7tNjNj9/Gx/ttkR4OUn4cjKP3MWM=; b=S6w27GDGKpMWBShq
	puqoKWRyxACijeF1GA4GzGacnVCm/7x0/qzqsB5rCpD5wxbhSYalJ/c61qKogxdl
	PtBwn2iNvUdqS9LFXdDEFiXwZoNYOefrcrbAcrWfE7DGdGKrY0Rnt9HPZ2Nvroth
	7sssS+QcTud4cpTkaJ6qCPHQINoJt/0aRRo4s2lBfNSbKFpasJni9sLyPXFGkKjP
	uuOLySMNRNaxkzI95/GOMiBokMmUXv096WCWZCYvsrZGQCnuGEsPNNPZbYTFSXF8
	dG84FFzph4G8kZ9T7FZpIdcDcSlsnTrcZ0sAz/kChyKClG27Qzdr2WDix4Lwv5D+
	I5kBfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kgp7121f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 17:11:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso11254416a91.0
        for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 09:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689107; x=1739293907;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93FHj3TQtDW6kBe7tNjNj9/Gx/ttkR4OUn4cjKP3MWM=;
        b=MsBKvcREw3NDcBddieFbn4FlO3SI5HpgTGVgRSEyVkldHTNGGKphYWvcdN3RnQb3Eo
         37JPuwT5vr93orkJQ/VwOu8MaDBkHbbD2dEsqb4wI2aLwBN29EYrinYxEBMlfxUywA0x
         V/0n/KfIKm0PAj9mYCmszgWFiX8tOGkTBcr5Dg9bbVNkc7a1S7cc97y2QBMTN31OXAPF
         wOLtvLZWpwdIqfw4+cPFqlOwBekXaHXjVZobWZMGs0+3Nrkf9SR7AYq6KKmZiuynCzPJ
         zNcQR5Naeb2qCu9uyoH6WdTjWHfh4wgvy26Rkc9D+KURmacqFcx/2s39AbCGiBevpZP6
         TK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj5OgMfFcUstgxsiv3BBSSUohLXWdnKaseqDQqqTxzqKCyGStQB9gaIq3+t27dNTaQUeZ+tH8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkBZb8k8w6vbIFTmCDsZn6Klkot+7M95M+klb10Xs7AtY+diAP
	t6uMTsytMCxvdlCn1X+IfzS07byfvsxmboJr/lUxXN+PaDg6rHNJ2UxFkKFdBZI+zW7NSVaJkyK
	KBflgsWhWFOuNQlU5vgWHh5mftkUCDwHzTPTcKb9EWM2s0NUQLgdDpiuuezyM
X-Gm-Gg: ASbGncu2z0qK0WTf84PnhfFFyi8/WRK88CGfepZB+QD4Y9nUueOcF8yt8I53G1b132a
	nprrAdYDSP+z72rM0hkh0dEW+ESZKJtfdNXbboumgVRXWKYL97IMsjEIa1+pK+L9UWUDLanpmSE
	CxczfNEVX2ZCnRnsfKEf80aX8YIQO6urUaECWLUu3noQczM/JukVceFWOEddfZf/O0T+63xK+eo
	a3adbFs7QIUgEeQEJ8r/LveyvItbc9RUIV2pACi6kBlE8o/0tNeboddHNvGlt59/FexjVj9hgsO
	MRdpBvvZpCAJPoN7AqWv+vsBxusnKCmvGZEbgEvbBWsunYVHErVbjC0XZtu0
X-Received: by 2002:a05:6a00:1d07:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-72fd0c14ab0mr35785526b3a.14.1738689107323;
        Tue, 04 Feb 2025 09:11:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHf9sTI3/bERhociH7aUvlwtJRs44kD1fFfsK6rqdKU/2j492U2HrA4zfIg5B8xfpPFbMd1w==
X-Received: by 2002:a05:6a00:1d07:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-72fd0c14ab0mr35785491b3a.14.1738689106909;
        Tue, 04 Feb 2025 09:11:46 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf8esm10824195b3a.28.2025.02.04.09.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:11:46 -0800 (PST)
Message-ID: <c6e4511f-ee56-4df1-9dd1-1ff47b2c0f0a@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 09:11:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org
References: <CAA8EJpq6P=ENtPHxAseD2dbCmxLJ2g-YVrNHVehgQh4tHk6tdw@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpq6P=ENtPHxAseD2dbCmxLJ2g-YVrNHVehgQh4tHk6tdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4XVPtCe9_bHkxGLXQyJ50LERgdxELDh1
X-Proofpoint-GUID: 4XVPtCe9_bHkxGLXQyJ50LERgdxELDh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=928 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_091149_912565_BABFB676 
X-CRM114-Status: GOOD (  14.12  )
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

On 2/1/2025 8:03 AM, Dmitry Baryshkov wrote:
> Hello,
> 
> With the hopes of getting this into the February linux-firmware release:
> Please add the following BDF file to the archive
> 
> * description for what hardware this is
>   - Qualcomm Robotics RB3 gen2 platform
>   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> * origin of the board file
>   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> release, licenced under LICENSE.qcom
> * ids to be used with the board file
>   - WCN6750 / hw 1.0
>      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> * md5sum of each new board file to add
> md5sum bus\=ahb\,qmi-chip-id\=1\,qmi-board-id\=25\,variant\=Qualcomm_rb3gen2.bin
> 39b270f43cb6d733cde607bf2b23e2be
> bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> 

Qualcomm will handle this, pushing a BDF + regdb.


