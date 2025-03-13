Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12993C282DE
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1qHYlOfwaIa9F8NhGAepXYgOg3iVgKToWFIujHQr7Q=; b=Es1vh3IyXnLCYMBO+FCqQqJfgv
	ZDvhDounurTkT9adrfKLPKsvJlzLbDfjdEdz0bPEweWKEGaALzzc/yOKbEKVW/4mXw2Z09722s3qd
	thpmxb4qPPWtelQWaYv1N8/bNWaDND+Iwb1oAVk3qocH9PT3ZxNwP1ISbA30kTaFKDV2iX5Gdc6M8
	ytp2ptu/aNITsfrPyRx4yVRYuU9IvxsH+QGSiHZI15hduO9ycSSJ90C6nQ1GzAO5KlPZtFrA+vfss
	5TExqfnnCkwY3Boxu/F5xlFfbQKYTdBajjvN/F1nIHij/cI8wfMHsdXYJ7etHVjj6EOYmV1JjuS1b
	ryYgYgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tssMq-0000000Clwh-2n2s;
	Thu, 13 Mar 2025 23:53:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tssMo-0000000ClwJ-1Asc
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 23:53:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DGnIpJ022547
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 23:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1qHYlOfwaIa9F8NhGAepXYgOg3iVgKToWFIujHQr7Q=; b=RPjRJhj4i13DyISw
	zz5+4A/xR1gTJnoZrUKDpkGEAz1a929GrLPfOG0t5ajBs96ENsHjpaf/VtV9oCFj
	PjL2OKh0GXkehenNDE1/GbfhF6g8VqEd2n52DYKuajcz7WB/1MZpCRijGgLJtgtE
	sDiMD9iBrwj7cRVmGIx/Fx7QeKTjgmGlDRPSX/mDXnK9UZjPCIo6azdhpPNW+fXt
	C/PNF5GvyskW5GF82kpXmp6F0CDr61bZr1B9TAU3GhHvop4tIKmqiFrDMllI81PU
	xPxi2ywG+JJgOwJj+emdaZynXNzPokFVcuK+8LZflrQq89dHio+eZYbNu3/P1Zcb
	5jKXOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07jfd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 23:53:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fec3e38c2dso4055785a91.2
        for <ath11k@lists.infradead.org>; Thu, 13 Mar 2025 16:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741910011; x=1742514811;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1qHYlOfwaIa9F8NhGAepXYgOg3iVgKToWFIujHQr7Q=;
        b=QBheZh1UNoG4W7FbajxJAMFMZTVBnLb4MrW1a/6rMFIVYpYW2E6007pYZyF48i5Hre
         QKfI/T/2NLK27De5Sm2qsqe5UU/yBC2mvzahp3sYqe8lWwnVx3kRVpyGCGQL7Ol13HZI
         bMSGKAoSeuCSG1XhbwogJu7HS7lGu8rT+wAaeIA1QUfuXlWe6Qeg+UL8X3iGZWUB6VK2
         V+A+CCFbFGyYXhBBcoeQojnfgB1orGbCSL9lhDVWhpxDA/L0U5pEQI+DQkyPll8sScqo
         6+jLJ1DN0Wx1BeF60e622NrXEd0/fhBdnswPYU1vNY65bWGQG4fCClfLOIN83SBdbF3z
         fYlg==
X-Forwarded-Encrypted: i=1; AJvYcCXorO+L2cQLn8BNEQaKDke6NFs7BiXRgrclFinuXwV4Q0YRN1we58msVrLxxj9gpqJlvsCzA6I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIy3CAb41cppCA8gy6p5ItoQ4L7hh15PraIn+9smAcmCLbMhqI
	YeTqRkLxKHojvhukLl1UgsLJBPDhJ+q0cLO60EtXnlNWNwSU02a6B/i6tvHrr17end93eQW6e8E
	yY39phljuR+A7Q0JoE4kFtF/DXv2GHd3JixS+docLFrfPoD2gGSoFMLqIt9Ls4SqWdHPg
X-Gm-Gg: ASbGncsdHBtd95BKCnbAA8ETS/oXcF+oDvrRiFdDoAFHr3qebBjjz5ykRXS/MU2CRut
	TXyUNjRgzIiqiU5+lLLgIcmwTksmPISEWFvBS6WxYLXBQPG/ztqo34nOJ7k6VUVcn/pXE4yPp+o
	slW/9TIY1eS7Es0v4U+gSIeEUYllbDG2vB6XQyNjkamIO8BSdpPxpGxVldKo77nqdh/qFW/IwUa
	dxRc13raa7Lnj+0Z+G5mDvPyOcuB58MQLBSrKfu6l2E/M7nkGZwORkU6y7Sv7HpRhojdvGGEgoL
	J6j84U89a8HSD2XkPtuo422aGz/oWq76eDU9guhIxOS/ClOOtMWk1hBvyYTmQm3m+NqSOChnUwf
	uHNl2unis
X-Received: by 2002:a05:6a21:328e:b0:1f5:8e94:2e7f with SMTP id adf61e73a8af0-1f5c12c790dmr698722637.33.1741910011155;
        Thu, 13 Mar 2025 16:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM6b+l2sHUOM4fapHzw2f4ilNzLLFqdXS3SQzF+UQWAtBtRNPOP8tJRZpq6HKBejspqZR3Cw==
X-Received: by 2002:a05:6a21:328e:b0:1f5:8e94:2e7f with SMTP id adf61e73a8af0-1f5c12c790dmr698706637.33.1741910010801;
        Thu, 13 Mar 2025 16:53:30 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea0428fsm1864011a12.38.2025.03.13.16.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 16:53:30 -0700 (PDT)
Message-ID: <06a86ae9-6537-4d48-82d9-60fb7e123054@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 16:53:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] wifi: ath11k: add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-10-869ca32170bf@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250313-mhi_bw_up-v2-10-869ca32170bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qEWjGj_zYXF4gR1tpWe1vRa7P00Z8b9W
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d36ffc cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=DXIUzMgivY99M8N_Z1sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qEWjGj_zYXF4gR1tpWe1vRa7P00Z8b9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=875
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_165334_446273_50685765 
X-CRM114-Status: GOOD (  10.38  )
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

On 3/13/2025 4:40 AM, Krishna Chaitanya Chundru wrote:
> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> Add support for MHI bandwidth scaling, which will reduce power consumption
> if WLAN operates with lower bandwidth. This feature is only enabled for
> QCA6390.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Tested-on is not an official tag but an ath.git-specific tag, so it should be
separated from the official tags by a blank line

> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

your S-O-B needs to be added

/jeff

