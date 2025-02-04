Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7168C02194
	for <ath11k@archiver.kernel.org>; Tue,  4 Feb 2025 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsDGZBIjvd4ugYUNZOpTcyGwaYThqVWQG2QneGzmYiI=; b=nqucIDPcfg2VJTDCearVia603G
	yii20rPA0/pG1czhiLe3765H9EDdy8VV80HR1oEekD6+VT/naZqddNS00hppZd54ux7wvDLQTlnht
	8wKV1/hRkDIEr5vCU339dQo+HpmipIosAhbajyR5PYp9c2ky3bxGLdc5JKS6MVRGl9QP5gI0xE9HY
	yJHF3cXlox6Yv2XE9xVS4EY4on66NDdX3e7WllQoDGHUZchm4l6kQtVM7WQM7twd/2eHhKRkD8n4i
	FGEBWIa8EFqKiBDfGj4l39wfO8Do8gdMYgGKTR51BtjxiJOMFbxm0YByJFTEp60FgxmMYAlMlODM9
	nQYIYr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMRa-000000013k0-0PmU;
	Tue, 04 Feb 2025 17:10:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMRW-000000013jW-48pO
	for ath11k@lists.infradead.org;
	Tue, 04 Feb 2025 17:10:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514E5iQj012549
	for <ath11k@lists.infradead.org>; Tue, 4 Feb 2025 17:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsDGZBIjvd4ugYUNZOpTcyGwaYThqVWQG2QneGzmYiI=; b=V6ted2xtAeG3Vcfz
	/pgbq9m8UEBriwm6RoMU03F58vepRS12WaPbTvg0Ca7RGl1zpnmYLMkx2DJi3mzf
	VzN+P/ZzbflfTPK95tzgcTJgSbNO5N2hUKgauqWohIBPx8FlEmnBH0VagxWeH0xo
	QFcH3eZfvqEUE4Iuh0LHeN2cRrtFaqx26td5Zhyc5Uvgp2GwJGombRyh0TAuBbFf
	aaCk7FqLAbo+0O05xqQzd5G9Gsg+LrsK96Ne5RMoU9EXlBv8fOPj3Kui9lBRQuSm
	LnDxi5G4L8JVZSV2Ryll5/EL1xHbWbBrVz/3+3zs0yI4qIINQk97dhbra4SzSl8V
	krFarQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kmbt8fnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 17:10:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f816a85facso10950941a91.3
        for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 09:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689032; x=1739293832;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsDGZBIjvd4ugYUNZOpTcyGwaYThqVWQG2QneGzmYiI=;
        b=sHmKrADvhxTTKbLsJeRFj0IpKD3xnELTUV3UG3+kZSkuYU4En6ia+aYbe0oHne6uWL
         q9oti6m+yTcXQ2L60xmMw/G6nmy5LnYIbx5akhKHyo6FlfhmlQAU0YJTBRuV9sbc/fu4
         hWw7HpAJjYcKkrjTKGg7v0ggIGUVGBosjW5I29Cxy3VmTxYmWJxTF7ESYazIC9e21uHa
         +dnFZpxs7D0E7FG3Lol3rtKbxMrbtTW7llDy7AaQVPtMCDgJc2ns9ToIzoRTt9MdB0QI
         KgUaCovIJkhRkTUxKXcb/WtJYyRaq2t7lDrP/Z/b8DNn3RN4/b+VsayXWdjRnZRZQ1Bh
         ARsA==
X-Forwarded-Encrypted: i=1; AJvYcCUGEpzrWbZFY7sonDICAUi/4lEDomSrZgpXWgg+Ddijcgvng1CvtulqjNE3kYg+nKpHknNO6RI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEtKdqZx/AHxc1PKSvsZimdOYwCuNvoL68yBn0XyQ5Kb6KLtNg
	QZgbPkWEKRywJgxowf1uPcZB13XBq0IKtMeKDMxOlrfrjGvryMFzzT0xvDP5tp69ia8PC3m54qV
	5DM5T6ufH60QdTl9egQAkfOmpdkqV6U3i/wbDVnHk4PiS54l0bomplfgYTw+U
X-Gm-Gg: ASbGnct2N6SKxe3UxxqPxSzwikgPzx/G+AnkmxavPxhluDHUGP4cmL36hI4wneycf5I
	xq+EdwD04r29pKyDn5BM2i5i0uZJlpQeE6DU75vI2mnt/RpOefsopCOsswbfXxIYyG/TyhJwcc/
	p7fJClkNAFhiPoDiaH2dqEsPpiIWFeyO9ggtby4pA7yxeTTqLB/EdY6QtBw4Hvi8Bn18HIjHBo8
	RbtNmDSka3WqumrCvG78Do3vxLn2BB4iXhl8bpnorI8E7xt1mqoeYlW8jGviiqOHZrH7lAGQFRk
	+TjI0gH3D6sFuXpU3fkIsJHdWS8KeEI3AalF/8BV60Nuz0nLxc6KQRd9+ERx
X-Received: by 2002:a17:90b:524a:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-2f83aa82299mr48464914a91.0.1738689032148;
        Tue, 04 Feb 2025 09:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzCWDkniKX+zBYsFG2EMNZzOthXO5bVaro8s2OVGW75t4hi0RRGwvhIGBaMTmjQdoebzT3Zg==
X-Received: by 2002:a17:90b:524a:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-2f83aa82299mr48464875a91.0.1738689031782;
        Tue, 04 Feb 2025 09:10:31 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd19c6sm13781967a91.19.2025.02.04.09.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:10:31 -0800 (PST)
Message-ID: <8bda08e8-e63e-4dc1-95f0-793cc5f4ecb3@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 09:10:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-firmware@kernel.org, ath11k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
 <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rC_3KqxcF_vAgPoMu1xgra0md6U_cZws
X-Proofpoint-ORIG-GUID: rC_3KqxcF_vAgPoMu1xgra0md6U_cZws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 mlxscore=0 impostorscore=0 mlxlogscore=900
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_091035_142933_CF978762 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

On 2/4/2025 8:59 AM, Bjorn Andersson wrote:
> On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
>> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
>> NAK this.
>>
> 
> Acked-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


