Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0491CD98D2
	for <ath11k@archiver.kernel.org>; Thu, 11 Jun 2026 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0RiQNzKW417vkjMQkmym11eTxmsfGp45AkrTPKlifY=; b=ClDpSBCVsenRqWf9NUsIPjchcK
	gdAvO3ciM8BhocAuSW+JdOkJ/wGuaocVsYqwk2OqP+VDSNn06L7ZzYlPx+xvV8X9r9mWlTdo//mW0
	+nMS8XySeqKTKui4UrE3arcMK7pKEroTZF7ZYRdKvluXqAG+EnAJNw/bisv5lKPfCGU0yqD5Ay1q3
	tFR4tRqrDHuW9OFbk7JuIc2qGXrfwXgCrfretzZuKtfLIc4Mr5P9Sx2B+LzZUTCxMNn7eD5yxZ/Z1
	5RH0hH1uro7GJDPnXvlAYjSgux/unpcGhYDzjk6JyzEef/C6ON4S/8ce+6upnzeFHBTxNHeInCZUo
	xD9EXR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe8r-00000009MZa-40DQ;
	Thu, 11 Jun 2026 12:04:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe8p-00000009MZ4-1LpZ
	for ath11k@lists.infradead.org;
	Thu, 11 Jun 2026 12:04:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBS1263553
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 12:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0RiQNzKW417vkjMQkmym11eTxmsfGp45AkrTPKlifY=; b=BGtw19oGKNB/HWnP
	yq/EmwUlaOsudKOSR02wTI4jjuMRQpJuFqB5jrtIyovdYrbVvtM0pNx23k1IaYuX
	D7vuzLzmjgiucyVEgcWOZB2OlDDpZVx+Rb9zA6+VN0NXCCotSgsH8DWQXYx8aNs8
	w6IpmV0jmKN2o8KuGoGxdPlqUODpQ48JzDvCKnvRz06q8WrAYtkm0E8HzToWUY56
	RwegB9KBvinRANH/I2WlEfrrHPK/PGTf5qmd09XNchyRB0HH8nk1bi5ig7enKoyb
	S1CMe4Pq6Lo3iFZqhKED/eI/pyE8NgVtSGRGEzm3CtjyXnShmG5dx3/wDnG7ribp
	B0QCpA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu91g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 12:04:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c53e2dd1d6so326676137.2
        for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 05:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179450; x=1781784250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0RiQNzKW417vkjMQkmym11eTxmsfGp45AkrTPKlifY=;
        b=HQldaTxYASvrTh45HUY7d3Gmcx7fevnJ0VpQPv8N5xQbJXxQGh9tJT00uTWw7Wqsze
         usQSCgbPFkWwG8gbPMEiKsNN7rShSiSPNhababhXDn3k5e5IBcgnbFutGtt7kQG9W9UN
         Q1NfjnBWq5qAsku/nLV5n71bswBHsHZATc6E0cjLlv8eMNykORW5LoUZ98kg+tIZtvKn
         0gOqtKiQM66Asa2CCLktsKKaJKX9hswHMLJTijhvQ0nGv+uE1fYczJgGBnyaXqKMvb20
         TV+J5jNFBXkJfyw+tG7wS6EnoqXHTjf/4xzA2zq4DyjWwAw+6JlgivvWSWxUr/nWi/hM
         vWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179450; x=1781784250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0RiQNzKW417vkjMQkmym11eTxmsfGp45AkrTPKlifY=;
        b=UMi+L9AO2gYSFMwo9SWSUr9VehAp3Re414NkGuPWQuEfNamt9e6oI6CjC3HXucu3vD
         yMOfwxPP7a2XOYWLwlZXI3M6WjVUtxIzUQcMZyhILeu1aCyUYJO8SJ3YzW/ajcMmU4nz
         fPP4IDeWWvxdRE88syt1e/c1pr2KP7BZ56ckwoYCq7fWHeOAhFdrWoVW1zHQDkUbWpOQ
         KEaA+6+gdabN3iF6Y4zdGyXg4j9x6HrqS2HGENcRmH5mbXoNEt/6oMAybMrlchM4X3A2
         XZ8Xf5ebV96fx5B81SRtB/Am2+TO+HXoTW4qAzvUMsvlZEXZic8ut3uAng2F0af/bw2D
         QSeA==
X-Forwarded-Encrypted: i=1; AFNElJ8PnfKfqAD4mT32FCG048Vbf97iwtByra5jQs7gTmt1ydexdWBfcO/Pxty6wAYDuGFMVY9r/kM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpfquHxcLNJs9dfy4wjQw1PFi5T8b8bH5ZpXDkdCwwnGlmh51f
	Ph9IwRFX9zoesjAjaUPMmytcwP1iTiRh23OBQTfE4fVn85wYYRIYQnoefSifx/Nl1nRJLzco17F
	IBmAOSSllrkMBtUEBhdw1d6/GmaEDmWAiNKal6Mp14iiumifBxi03gmDLrcA5dBqU
X-Gm-Gg: Acq92OF2IMtt62i4jr5cvtSz2Zph0KIjCLDuBaD+7GVoJOPGiBxabtlVfwf6KUs1AD0
	1C3kp8LeBl0goSQHq5sQW+feTeHKv7x4E5EHn03zJAlMIBNeElDfbLL0aAcsk26f3DRbd+/vXyy
	tSiNbBJ1NBQ5H6GwdQ7j28mj1KTgnTjwUVjOAeBkxGPeeoVDC7JJn/cSO9vjkCkhqVHo8HQcAv5
	KBzSZcLTuUAJPIKqvnN6w2EZZ6sVgxS1OE7A/S52bQbVEPGg6vtlKrDdjVLRb42T6p0xGYvM24+
	Ozde+9RaPc9T5g2+FGzYNtyO32tX7dSVxc9dgoASciH1Xr+kvPZAqWmlNNK4XL2/mSEGhQf7DlY
	OgE48cFOdWteXf/O5LBZBdlZQXZjb1uPOD32WueM5hgcjhthC30WpNUnn
X-Received: by 2002:a05:6102:374c:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-71d5948c72bmr230957137.2.1781179449899;
        Thu, 11 Jun 2026 05:04:09 -0700 (PDT)
X-Received: by 2002:a05:6102:374c:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-71d5948c72bmr230784137.2.1781179446795;
        Thu, 11 Jun 2026 05:04:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm10883829a12.21.2026.06.11.05.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:04:04 -0700 (PDT)
Message-ID: <34796b1c-7c82-46fc-87c9-6c0b9327e894@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins
 config
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2aa43a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IZRSYuELQJJGqPscr9cA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMSBTYWx0ZWRfX8xdt2TdA6kuN
 eMqMICzDBRj+kjcBLZ8BmwBvx7GwxU+FjBy9X0hYa4I5kH4tI573JNPr9rpgO1zqa4OeqGH91+G
 msdasE4FoGs/QEaf15A1f5DldtnHMb8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMSBTYWx0ZWRfX9Z5p4gLYwqYC
 q1LO2ZF9gEHx9OLRj+HWpoWb2RjxKmmnxDq+x8/riW3BaNP6fWrWMUCpUbjCWTAiU5kWVR290JT
 O/uyorQAANNVhWYUVaMePvCFPLeHYbRyK80fzCCjqIQOQHKmv0EDcenXCknI9oCNNe99w6xDXjX
 uZ82r2RjYzYKJMrXHJXVoDxgCK/6d6uQCL+Z6flAr5qchIkEWg0LVs/ab3LOKiv3EDEC2eL2JyJ
 PfkL7DBAkZ+kyYp6E39qDIMIGF+quTpPaLwDp1ugNVby28l3wunDyDlRqTbwOvDOh3wWF7LyiXc
 bvawP8nzQxjqSIW73NU8OtyicMzDyeYEWLTkqOfV6N3nUsqA30DGfg7btY4owy7vU8lsjTdcvzo
 u2v+9omMyKE58QVHjw6m9tTXGmK3NotifDNDOdGSsWsHnmda0k2CNpCCUeEYeAyrAap7/6XhCoA
 EsNXmtU5AQ59bJB3fqg==
X-Proofpoint-GUID: rO9l1N1G2x-grnPni2WAdhMDnXOLANoQ
X-Proofpoint-ORIG-GUID: rO9l1N1G2x-grnPni2WAdhMDnXOLANoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_050411_367704_AF83FE6F 
X-CRM114-Status: UNSURE (   9.77  )
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

On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
> On SM8350 platforms the primary use of UART18 is a 4-pin UART (targeting
> Bluetooth or other similar applications). Add all 4 pins to the default
> pinctrl entry for the UART.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

