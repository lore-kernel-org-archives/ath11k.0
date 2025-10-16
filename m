Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942B6CCD183
	for <ath11k@archiver.kernel.org>; Thu, 16 Oct 2025 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSZmoMDA9GlWt6MSUxaRnwD5AKBcfFGOH5EA+qjhfJg=; b=tIRhLZD+f/R8YqeMSTjKYKMHSD
	4/y5shieHnNAZ2V1ucLjgN4/6QkUM1eSumJbu3l73PThJqPD6uDKSFg4EqDcQ+E4DAU/drvKfwIrO
	fAPYhz70ELbywTJBuGQJ2pwmwzAzp8VDNs6RmdiVpv9DI9j7MrCWrrMRKYag0/PCmzD5yrlnOGnee
	uV7h4CJndKhvd2lNc+UHkhmimeCntTO8wPG3ncNB8TywMNk1ZiWZecwc5IkUMEnhqzVNW5tV1rI/M
	CsO2lVWpP7eOEUwVcKl4RT81C+s4Y6DXEokYYu67zBKC4M0S4ljz0xenn9p+nmh4qRB7yTWQ1E8hX
	sjBLVj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KQF-00000004EZi-262u;
	Thu, 16 Oct 2025 09:37:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KQC-00000004EYv-3aMY
	for ath11k@lists.infradead.org;
	Thu, 16 Oct 2025 09:37:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G2O99L023174
	for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 09:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSZmoMDA9GlWt6MSUxaRnwD5AKBcfFGOH5EA+qjhfJg=; b=W7KzAM9KueEY7AMM
	MBV/SfxCoHHNMCA/xmV+NnvSha/CcGWHdCXqE7vFlyLcSz8wzig5vWfr9z8umTXS
	+9gCUs9bjga2s2zJmzzmQDUxctZd6TbSu0HtVyp+pHtmjcmYy/MadSAqYAbk61j2
	BPTKCWTOZm1hwHuGmYEoJMSCF2IOe3aY3KlzzFpkytI0fsEKdAgfEzOCmsBJfeQn
	CsGiL47UeO+O6qEkpXS0kv+HRB2yLZXqO/lCA9JguuJZElD8232+FMdRFcUMH1Jh
	w4jLFauxNrom3HdNdYBiH3LLzsimpbD5XXfbfwvjm5/cJkQVqI17Eq5Qo27DIZF0
	p4iRxA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvph591-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 09:37:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so514265a91.3
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 02:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607438; x=1761212238;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSZmoMDA9GlWt6MSUxaRnwD5AKBcfFGOH5EA+qjhfJg=;
        b=ua/4LOsr2j5waIdxYlgIdoY+X6GrYT/f7z4Gv5Pr/jbTo/eNhAOeiqbI6qR6Opsw/R
         kyLS/uyBjyVFnHBvoePl1DYbuhfcJgNZSVwXdVZgqUkfPRGGv10CINAsmBlzo798XgUc
         ujbtCu2n2zyX8anHggZ+3B22Ez6DRqf5tVu+BsTa+8wiM3GmNIkEivorjVtyLCE2QMPa
         PrxVYOPTx5gsyy73owT2joaaVQmzoDKKG3C3EKWZQDGvjM7WzHp+T4Zaz5CnwKMo9KjG
         5wpNJegoT+3v5ECYqvsUoclLtBCqlCpmMHc/c0dI50g/kljzunwzneyA56yWMIeK3Avd
         X1hA==
X-Forwarded-Encrypted: i=1; AJvYcCWEnT9zUliuw/bZ40qLVE3e8IIm3BrCssULQmVqv8UmPMX90ETqYWQstafe7aVNG3jwVvbsPQw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4qJTwHdJdJokFXP7tRkQpdDlE2pZrW0JA3YjupGKDzSf3qBgy
	Yr4/aqGG+IiDRnvAPwFLMbYr5MQAUviE1YbPRCmrmf0MGWuBApFGEy9gego/8n03IFdOvKnnvXH
	CmCGap1khkbXjDcHF7BuShpE7SJlmKEDey6jK2BPdePiJI9MM36K8qu81B7Gw4rMxZIkFJT39
X-Gm-Gg: ASbGncuVubaYe0oyJPPb/P0r/q/HyqDwp8d+RwhrJ9xJM9LjZ56vjgEVSTGjwUtBXw8
	EkewJgx/B2tusaryajoeCo/mH3a38JoGf7YhfNfJ4bhME6wqmaU46Xvfgi44+d57rWefKcjrPlh
	fwPTDjyYy09wPnnGvGVC3nEPN9JwGu1fhFR5fSifCyRLpAhIxfwGSlE0g/XmfRf3sj3zC5XPrZ9
	YdEtbHCoUcfgXFaV26LXAYZCDuVCdw2Xv2C6NSmtqesSwo+LeaXS/AzHSn4aRrHRU3YuUAN9bOX
	U/WBLQ6LMscioavXWg8vOab+WrlBPB+QfNgM2WmEAeR2VMEUQXuDWgCkbFwtRUEGrq8j3O/JDFv
	nJquwnuqkIgvi03nVycOPLTjlokLUFYMNzJm8NcXDDlny
X-Received: by 2002:a17:90b:4b04:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-33b51105bbfmr46451360a91.7.1760607438381;
        Thu, 16 Oct 2025 02:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDEsTdhhPn0O6dhyVG9bwG62wYz3gKhodfq7T5n+qSCBfKHnpKmSwkwR8o3EDdiJmqPXO7HA==
X-Received: by 2002:a17:90b:4b04:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-33b51105bbfmr46451332a91.7.1760607437957;
        Thu, 16 Oct 2025 02:37:17 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a31e443e9sm662305a12.16.2025.10.16.02.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:37:17 -0700 (PDT)
Message-ID: <4489f5ee-25cd-8547-88fe-148a9b8f181f@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 15:07:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: QCN9074 load board data file failed
Content-Language: en-US
To: Doug Brewer <brewer.doug@gmail.com>, ath11k@lists.infradead.org
References: <CAG0V13SM5VN6sfr_iMFBSHHOLFbW8-WK3=B-vt9qgE5nu0CmaQ@mail.gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <CAG0V13SM5VN6sfr_iMFBSHHOLFbW8-WK3=B-vt9qgE5nu0CmaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f0bccf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fbv_0k4yCltNBAe8aCcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfXxX3bt4NZuYd8
 rEjAAFPQ7KhFB15iKOTGE41EHISDyv/RN14mOCFbUg1ln1eiVyyIh9NHqKgYVv6kkRRqH1O34eY
 hWXphxtXhftOJu6Dvhedr9zNM1v18aTTfAHA7bev7JR1NEKVwqWb+/n2qpCr7BY8xUBsaHo5g+q
 rGwiJ9xA9WOFNh/gRywQNLnNUYPi4e1UCGAJwX0+K4wmOSNhFMoDqGJXTMHjeoIc14IR9vEv3YC
 bf1lvr5KZvb6LZkkhaWLd9pw/57ga1OayYCFUq8GkbLBiedr+hQhKzHk8grr8QSVhk5/lq80ay2
 pUjEsKqSMa/y4p2S75OZTyETV/LA7jJDb9sNXpt38Gc1xjWqLLmDHfAzVIyaCDJt+u+4EbAPfra
 uA3lNGNPszq/sgsF7KM0raxTrUFVxw==
X-Proofpoint-ORIG-GUID: wBa_o55X3ClQi7ZW8Mlxte2dDelbN0_I
X-Proofpoint-GUID: wBa_o55X3ClQi7ZW8Mlxte2dDelbN0_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_023721_008308_F45B705F 
X-CRM114-Status: GOOD (  13.03  )
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



On 10/14/2025 7:42 AM, Doug Brewer wrote:
> Hello,
> 
> I’m currently running Linux kernel 6.17.2 on arm64 and testing the QCN9074,
> but it fails to start up.

Was this working for you before with an older kernel?

> It seems the issue is related to loading
> the board data:
> 
> ath11k_pci 0001:11:00.0: BAR 0 [mem 0xf2400000-0xf25fffff 64bit]: assigned
> ath11k_pci 0001:11:00.0: enabling device (0000 -> 0002)
> ath11k_pci 0001:11:00.0: MSI vectors: 16
> ath11k_pci 0001:11:00.0: qcn9074 hw1.0
> ath11k_pci 0001:11:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff
> soc_id 0xffffffff
> ath11k_pci 0001:11:00.0: fw_version 0x2403072e fw_build_timestamp
> 2021-06-06 23:27 fw_build_id
> ath11k_pci 0001:11:00.0: qmi failed to load CAL data
> file:cal-pci-0001:11:00.0.bin

It seems the calibration data is not found in the file system as well.
Since calibration data will be specific to the hardware module, you
may want to check with the system/device manufacturer.

Vasanth

