Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6CDEDB7D4
	for <ath11k@archiver.kernel.org>; Tue,  7 Apr 2026 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=; b=cccgk58grNaFhvCKEFv0AsGfaB
	5ILDU231+FH+hZGPeCfsyWJ9g+VpQ9yHCfKjLYTDyiaIt6BO+a++i5pqZp1I4PBPeyanlbXGoNeFp
	oQSv7hCQ6esYrOTWRXZZMHrRouHPYCraJAq49BSke6bSUMoHHj/GQALVgIYMVDwMOwjS0MP4DeSVF
	Ib2NIjHM9RB/ClbUtkWYSC1xwnI+BVvaSK23H8JFcj6p9dKYNv9HoEb2kU/3aSfZBLUQ0z0tzUaRE
	hwmm48FdYAy6nBhftsR5OUZ4XfEyjN71WiIMJpKFfCUPa0LXXJf9p63hTrAcLdi7SBMTibD3iEnlm
	IQxmBuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2qY-00000006EHW-3NyI;
	Tue, 07 Apr 2026 09:35:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2qV-00000006EH8-015m
	for ath11k@lists.infradead.org;
	Tue, 07 Apr 2026 09:35:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376O0Ep3402569
	for <ath11k@lists.infradead.org>; Tue, 7 Apr 2026 09:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=; b=RzepB7amkneQ4mjW
	n/kBSwAwbeYO7us94i62DaMBfxEnQxK5hvTc84zycMW29DKt0PJoK6I7EEwm1e7o
	62G1hmwSs2O7XtdoKM5mmSABd/7kEGkqiL3XkCpir4eVow2JwLeCiyW38YRdc2aw
	2gLiDBSNnrM1UGS3PgM1CadkOWVY5OVvV6tb9CUSb8sUFYgeRnmRTSH58PhmylHe
	IXo+Zzu/acsprtXbOlCCRlCqc67BPeUe5ytuFOOAg8ahlJcUc3X+lZfm5cPk14SP
	EMLdi3dBTQb0dcZ02kdufIyJ72RQD92spN4WqFYvPOjUdYW+iMqqBXjNVWKqUKNL
	Wlq6Pw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrht2ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 09:35:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so19947376d6.3
        for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554541; x=1776159341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=;
        b=SZWTQdxl5gL6HAqNPhDMRPaqNS8QYcbS4dT2/a4Y0W+QRPRjzCeSvSheKwLlKz1Hhp
         /8aIf2dzGjMrtgIlMz48Uj4HN3syfrK3qKPplTBjniVQjyGsNAPCI3utzKI/Bbix8AFP
         Aaz5Mc43dTXaj9mhDbuqehsgwwOkY6Z8LCLg42C8U+xEEd78yWmQeumxP/LQvZDynPJg
         YDFSd83mD5TufKu7tuh2tAp5SDAg8ctLYOtt+i4xVvfFc/7xlSXgFGu3wwpHrSZtUTLq
         NoKG+61gB9NB3twKTbIdjjwB3DV32Jb6KmYl9+7GrYGmI/zKMnnKi8tfAiQtV3FaA9dJ
         7ALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554541; x=1776159341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqtu1eJUvsKIn439NOJePeGFRD35ZTFzSdDBFTmlzkQ=;
        b=C4cF3BGVJEMZF3pgPqQ/CsCGA6qjCr38+VfSwQ1eILc0oHXjSyE2RGEjQ260NHVL3v
         FeLZTro9gnnoGldH26fReHkjslNkDv8H5cd/puVMxZ9WI1UdqPgkoNDe10c2bJin8AMr
         fwNWhx4vA8l8IPOt1ZgO+cs6cqfFrLOY/Gr91qiFBgvhemkfCeG67ILXDQNx08QLQca1
         Enhukpgfm9qKf487MtJ261bm9TXnqscP4KIzXJghQvV6fR8/TXkX2BeBouyeXvYq3HOD
         EI+plJrnMZN3lwQFfM48MbV9frEzGE+Es4rTzxQxYowQzux9xMb+Y+fsVDdNm3nzAoG0
         jZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWqgP8K42I6RHBkiwlhM1TbkajGRfJUnnwTJ2vdUa9FSgUeFucKxmZHI9e6/b+Dpqq8umy4XJM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNNiHI+dbPGgcXzsYzL2/I6nlHJsGUU/D3E36QrR4mSJ2amkjJ
	d5H3R1C74LbxSYG6RxgSGMeVIVxyiErgbG9Sgwxejekv/vwViV0P0g972zUNcfe8AKemAPxR4tq
	GTCmkTHpnpOR8YfpL+Zky0R9WGUaAt3WI+wPFmfN0K/DALytx8PKpTOJ72rG8KoNx
X-Gm-Gg: AeBDietoiJuz01vz/eqPJ5mOje3nE42yGUlpDfG4nn9Nlg29bZCpEfsknxU41k4EtJI
	mwypncxEPna95WhJSLS8Jgou39/N3LjsatS7tNKEoF5rZG5+zFyMBQKYxMnyrra9y+6vmFgs4ZE
	WHnT6tZzsO/aBOwFKjtgim8/v+cK5VFMYtd6GlVNMNCvuWu8GROJxniO/bvXbbcKn9pylmNwS4D
	YCUgNW0h/ooirO+j3Fnw71tZ9ocw15yyFFkzK+m+yvKwehKPl22GjHF1eu/8w7X9DFPaMDOCnHK
	mHxK2IxDRULQy3C9L2SOODKWp8g64fd0MiRCTLFfEOBso5oGH4hBc+xo07ayW5TK8MTQXbCKhkU
	y7HIKiiR54yh3u8H9WS//ndgH1fkUEKpPJF0bBpOUHENZWEttjJG0kHd+8pUpbXuNF7hZaxdK9A
	t5+Vs=
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr180451861cf.7.1775554541029;
        Tue, 07 Apr 2026 02:35:41 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50d62d1cac7mr180451421cf.7.1775554540574;
        Tue, 07 Apr 2026 02:35:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a780esm4156402a12.19.2026.04.07.02.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:35:38 -0700 (PDT)
Message-ID: <14c61b77-d790-4e75-be79-caf8b7ee8e4f@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OCBTYWx0ZWRfX/UT7l2BUP+y6
 /gjnUBNCxlJ6ZiQiFRXs7rVsE3ZwPAODLKuvbmSFxi/3Fo7J+2viIk5lb13rOv6IE1SYRsWqY9g
 Vjlz6YVn+EEi6J91Xh10C/TCx8lYynQWM/yUSdbGIHjcLJXn+Cz6W7Up/EoXr7XUbSlIxWT1+KY
 uEzQuTpq9avJlp9n1rTYBOHnZLOyCGMO3yb6UDKNzF+aCqfHTWWuE2rFFnMbdE4tZ78k0tPaZOD
 wVr6ZQizBLhSVAgDiKEiLAQYxmrdixIUV7p8yCQ7nm1jPfNlce2zLgfROB6Y4ptcMX+hqJ2C4vN
 NJoIHHYQA4MmdRNoaE1NNe/uYHZpFPeJZLJoNJ/njCyso61CEsySCdxYzQoh/GMj2cAeeRDYYcZ
 /GmuAY3z+OnwxiMz+nAWYI09eSHyNpikq6C/EXgt7IVq5UgoZstyHCwiTM2l6xlgHsnO0B3+KDN
 KWA6VqjkLZQv40HJYxw==
X-Proofpoint-GUID: d-yZfMx94FEhwA6Eno6RU3bNRe98QweF
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4cfed cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=rDrCEZzy5hQS5nTwK98A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: d-yZfMx94FEhwA6Eno6RU3bNRe98QweF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_023543_208019_DFB98D78 
X-CRM114-Status: UNSURE (   8.84  )
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

On 4/3/26 3:52 PM, Luca Weiss wrote:
> Add a node for the WCN6755 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

