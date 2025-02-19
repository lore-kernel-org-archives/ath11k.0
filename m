Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0794C021AA
	for <ath11k@archiver.kernel.org>; Wed, 19 Feb 2025 17:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ee6+eorvO+pF3kR9F+2d8nZr7k36mhnL8mV9SwVW8g0=; b=SCd96UYuXwqRZu/xktWhgQTWje
	ZJQOfRFDJrxiiGtEMZ2W5Y5Z4hx42bWkkjFHQbBxR4XxhoK6helhsWbJlVDzAWcSGe92j9Uh0ouFU
	6bRi+2EEXqtb3bgMpcemKg+ImoZg8EL9h4iA0PvMM5T20rIASYuSYODLTh+CTguUCRlJw5zDFFgHC
	PXTzmsyLyIqmQxuaz7N8BdUl8P4L1D78Uk5ZNQlmg1AJjKzGYtg7N8nAJO4ezKPZSH/4xrF1q9KqW
	lrOuNSvzCZikFilHcC29B9owiiEyRtlEiC1xOFFxbS8DRdfDLWj4cck/859bkv4wf0xEYGFlmvi0D
	7HIUpwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tko01-0000000E82k-1er7;
	Wed, 19 Feb 2025 17:36:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknzy-0000000E814-1wrm
	for ath11k@lists.infradead.org;
	Wed, 19 Feb 2025 17:36:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGqnw2022514
	for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 17:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ee6+eorvO+pF3kR9F+2d8nZr7k36mhnL8mV9SwVW8g0=; b=Uez5vy9/RyiB0tv/
	f+sAocr9hCj/X06Z3bMHTU+2ai1VgItIHof8aKzgmHvGInh5ayGKtEfnXeb8ay+A
	42eTidUs9ObQN05SdI57k7/45KJWBJRKZuAceU+KJGrJE3HYVbLjhxbDA6hLOcBC
	jenY1OhDJbmYu3n3RPlwv8rn23DJZg0QzteZ2BFAObmStL5ANhGoz3dxZtqVKtY8
	QlTkh28gT6Ar9FJgpxTvoovJ/eG/z/AabQFRSV0uKIiiyoPVlg2b+Hvp3HRTTwJv
	9YlWggH5LJlgFvV8apnkfboxrm8dYbZwu2sPVuqpm94SVbwgBWIz8U55bnXOFW7S
	cyBPXA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3kgdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 17:36:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc0bc05b36so92521a91.3
        for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 09:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739986596; x=1740591396;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ee6+eorvO+pF3kR9F+2d8nZr7k36mhnL8mV9SwVW8g0=;
        b=Z3KRGo9aLE/k+cgFYKGudDBOePizEcE55qg8Zct5le98ByjtJqQwRedLJ0GqWiubus
         mYLDqh/D1Rv5W1CtOkVXtiPOl2X6fj8ssSo5sksYpmAXLSyHKot8zZ7mma2F6AqK8J/s
         HiP0V1lXd0LR+n9JW7oyahQe0bNaaNOkOxgrMTalFI9/zfppxhpX/yvlnoa0cbvaQ8tM
         zPSUAmZDkjENI6SZ3qckZojjl9rVmrXVTZMfx2yX2jTWZ0InP9DtfDgYbuOHxF9dkkbG
         3aOKMmK8LM10xympq6dKAm9pE3w+pE2vRH8/50mzYziPGHV2HelJkXZOOpxRGusvFzX2
         gtBg==
X-Forwarded-Encrypted: i=1; AJvYcCXK3u7rrfKMTll7LKQKd2G1G/yc3DHM6lGbXbn9HG67lu5lraFLzb9e7zc2WqJMLTFytm4T39g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9OMT+CTZt7tmIvK/tOjd+7yyl4WSr0xd/Yo6qdkjfb0VwH8WK
	zHnfTSRAnDwPG8wo8D2dYw1uVcKeQs+5kW3+Ms/1/7VMk1W03whARkxEWNGe1a4t47UG0SwBG0t
	q0XSvPJU4d61nqiHAxZUWbrIHjDRdF9mNFgrT9g7FTBSzsBM8TSxPIYVIZuYD
X-Gm-Gg: ASbGncsH8alzImHpmm0ZuPgZEL60y51LD8xI72cUWweDIRtyxmYISxVWrv+415RZiCz
	W1fBxYXtr/4FBJtGRo9ak/+Kqjz6PXSmD3N1wumLHJ9p5ZX++fy2qV4siGH1dKpC6h91JMw1VGn
	+jYEWaSL3DJEZ2p9etuKQpR3CMBUu8ZdEUOw0F7UFwSPANDNeV9HOjpKNFI3fGBgMwFtINByjRc
	guRzp1YPuT/8gizowQ6OMTPdD2Mq9eYw0NFtdfKFguDkL8D8ZVKGBm84Y0NiKh9fR4xLDUKtRJ1
	ULd1tAEAKof4ZU56SFBUu2ZwaekqYWzDfrAWVLodsBB2B8ATDHlk6ZGg0dQp
X-Received: by 2002:a17:90b:3b92:b0:2fc:3264:365d with SMTP id 98e67ed59e1d1-2fc40f0ea25mr29237106a91.11.1739986595761;
        Wed, 19 Feb 2025 09:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJWmXWsxGjClVm/zthfCXF+H+3XyeXB7GQZrRmqkGHU6xzsOjlVcHnjYZJYGEt/oE92j+xNw==
X-Received: by 2002:a17:90b:3b92:b0:2fc:3264:365d with SMTP id 98e67ed59e1d1-2fc40f0ea25mr29237070a91.11.1739986595423;
        Wed, 19 Feb 2025 09:36:35 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f4f62sm14557474a91.26.2025.02.19.09.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 09:36:35 -0800 (PST)
Message-ID: <b0027c1e-cc0b-46ff-8b46-774259f3ed0f@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 09:36:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] PCI: Make pcie_link_speed variable public & export
 pci_set_target_speed()
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
        quic_jjohnson@quicinc.com, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com
References: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
 <20250217-mhi_bw_up-v1-7-9bad1e42bdb1@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250217-mhi_bw_up-v1-7-9bad1e42bdb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nsUQpZZcbc7W-XbgxG4vw_o8wCnl6P1-
X-Proofpoint-ORIG-GUID: nsUQpZZcbc7W-XbgxG4vw_o8wCnl6P1-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_07,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=607 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_093638_648895_11C8F4AD 
X-CRM114-Status: GOOD (  11.77  )
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

On 2/16/2025 10:34 PM, Krishna Chaitanya Chundru wrote:
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 58f1de626c37..8a3b3195122d 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -305,6 +305,7 @@ enum pci_bus_speed {
>  
>  enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev);
>  enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev);
> +extern const unsigned char pcie_link_speed[];

This, and the Patch 8/8 change that uses it, make me cringe.

Should we instead have a functional interface so that the client calls a
function to perform the lookup?

/jeff

