Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0B0CD8C9D
	for <ath11k@archiver.kernel.org>; Thu, 11 Jun 2026 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmR4e1Tj2lOm/nlzcOpM3CCIVcV17DTEFBWvUeS7yO8=; b=19Rnk9YjO7SdeknAs8VGwHOZE0
	XjndrcqcU/+NtU8UOpXsmxVQaa/Eb9+X9FaZ8qgWkMwgxpuy5aaAN4NyQcolaEvnWyit08wkf0hd+
	frTYa+0fuLn7RMhSoeu8D6hSHsOhvoq4/n5i1QOhYbMU1si7sS7SY3XXtf14f/11nyWF/CM1xUC7Q
	Ru/GDv2QN2+fJrwWxFW9a00WoR4CT9K3Xc1xD2/gX2Y4kddVoEAMqzkXZNKydX/XANxUckvhoHSV+
	I5OYIboenMXc/4c7nTvmJwvR3uky6EAg+dI/ePFZMYbL2wcYQTQEtxSdGe4OpZ9tS8wC5M5A64CIl
	s7qeP+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXleK-0000000A03C-2hNr;
	Thu, 11 Jun 2026 20:05:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXleI-0000000A02G-2hdS
	for ath11k@lists.infradead.org;
	Thu, 11 Jun 2026 20:05:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Uu71427000
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 20:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YmR4e1Tj2lOm/nlzcOpM3CCI
	VcV17DTEFBWvUeS7yO8=; b=RAqxCevDyP6U/Acy9PUbea+A/i5HTILTR2AhhSCx
	axV4TvFQkK+2y+J+3UBiXH86NO0WvhLTnxp3XcSfyOr31elHHO9BbsXERpAI/UhU
	8d0OAdRJz7pbQez+he93JLmCBmawgEYH0JsgtbOB+jjNIprXGN9Hjpp86R5PoLvM
	RVfN2lstzHtk/3Bu9V/E/dtjnRhqFjg8SJmiF3Z2MUTSTdIOemd1nWXxANZVvHow
	36X/KozWcnl5tYGNcECKkGUsL7jL92jVkFg0noGxjO6NoHbPD1SDkviSKf7VFLsr
	bQ0S8hNEiDDAYQC4PvCwCCpBRRTufHAfQTGkmVuwl4ixew==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcggbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 20:05:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c5794db0eeso165273137.2
        for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781208309; x=1781813109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmR4e1Tj2lOm/nlzcOpM3CCIVcV17DTEFBWvUeS7yO8=;
        b=W1i2Qp4mlI0RJcdlCEQ4W6tP6FiOzuu8p6lfQDoM5dGckd7OaJ/ztkPHRj0SiqL5oE
         EaSqA2tUVvgaDq0SazNuNSJz0SrvAwoglJFs2uUPiWvgVQcy+TPlqUYYP4Mo5dWnw6Gl
         kQKPzKcdUjz/aGamb3CuPO0cvx019dT91Ot+7ZIQxlfekdfxnsOEgdkM0zukSIc64Qwd
         JQO2AE/XiGTEvPoJBn3n64WwfK52355RLScxey1JOSa/6V8x1CihcmYBir0YROFEmYIP
         q5k663zmzPtAznlKYi7siu7mUYRiBg18d9QedNzA3B/kpF7wUGOw/19nn2N5nxZidBtz
         Lv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208309; x=1781813109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmR4e1Tj2lOm/nlzcOpM3CCIVcV17DTEFBWvUeS7yO8=;
        b=YmDj3QTk74Y3N5eFqvpxMBhdmns+L759FBeGiHcLAdYy8q3eMF2AYlkWPTbOY/A4f4
         A0TdZpTD8yeH/gzZgDpFKzeJ2Wvps5vhb8qDobj3k63pbOTIQdBm9Mm2Xeq8D5Xmk/50
         WnEXG3e9aNUjVikYPRO5mRPNZ8Vovc0mnVWio11DVqr2sVU9apsNj0UKKK6++rRi2GX8
         TlbGbWMG0dr/bgkDrZJuVA3ZOUKWzGluLkoqGvK8vrK8Py+GOEzbK1woPf9HZ3MRHobb
         7Zkv1S3BLGu3KQtLEEq5+b8+D2Vv9QjrrQbr9ejcGCFfXLKoKOXCXsjMXbW9lVXQUKqh
         251Q==
X-Forwarded-Encrypted: i=1; AFNElJ/yU6QAhDaQSN9n/9Qn0WxuzVzxJA+29dEHlngq13z5VQFVVpuqPq5VuIOWARvtFTS0b7Y3P2Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwN2CWcC9XcZ+qLhkXYELV6F/QsYprGXCDYBL1f88TYg6nACYxG
	R8mKfmwoWcWTjqOTXBsRKi8apweIhC11vJyzOqyqXF0wbk4q8ZzIdfG+Moum0/HFGLyFi52BXZX
	h+GsNffHEf2lUdWgci719MjQJMlOnOS76ZhtfjwnFa+caMmnzIvo2MPVTh8nvKec6
X-Gm-Gg: Acq92OHYQQZHbtpVST/Vpjs5jhvqs81+LwKzlLzWjjidcf8h5bh1c7gWEvytOBvMWCw
	eztDZrqiof8diw/lBekTAS2s6ltvvhvWFIchnt++qL0/GbwKONyO3DXuzOle0p83SGItOWAzUdj
	MUoeEtQA2HsxF9pq2TewWAixGBxA0vVDrXbcSPXi78Snbiq8s2SiFhGoXZ3y9FFljvk3zIKS/FF
	m23zaXQMnYJ/T84/pO3ogUQ/F8CqbuUdJeT8WvmGERJpXUPFrOnJztfLKctvleSLmO8Zy99mZnw
	RX8paO2QiP8CZ79vD81Ttty/ljk+6LTzfUmL9/gGQlglJOwWDSUqUgon/wo0SNEi9kPsVoQSqBR
	tdYfqF9/Iq2HFZ6Dcep3Ubfd37ZVkFmqf0wc9POz6JhFiKRUjXkCRibfbuigFi4hCCiYqnQele9
	/O83NyTQOd72RkVfCahI0dpJ1dZKaZXRDo7qs=
X-Received: by 2002:a05:6102:5088:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-71d5c4731d1mr3076982137.17.1781208308980;
        Thu, 11 Jun 2026 13:05:08 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-71d5c4731d1mr3076940137.17.1781208308534;
        Thu, 11 Jun 2026 13:05:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd98d97sm108447e87.80.2026.06.11.13.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:05:07 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:05:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/7] wifi: ath11k: enable support for WCN6851
Message-ID: <fiuuh6rwohtlmwdiy7cwqee62e7jrtdgii7fklfy7jkgh25yul@mzlefhqgzo55>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
 <20260608-sm8350-wifi-v2-2-efb68f1ff04c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-sm8350-wifi-v2-2-efb68f1ff04c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMSBTYWx0ZWRfX38HPKQ+0uolV
 Rbe8L5t2MT6/A6f0XEHodhDXlsaGp9Gpw+ifUmi755DJe9Yh7MK4xPD+5BxR3slzQWKxEnk5jIy
 wZSSHQzVh0gljPhY685qjZw26jP6MdWnycB5AoFQVEmP07qFWbSwgD9omYGdADC8Enhat1m7ncA
 tNNk+ghXHN2zPSIH0K1mcP47u80KZ6MMqbhLOdz80Iy7w2zKKfjYFLxX76exaJ0SaD9SBqwK+yZ
 /CUL4/yNTpqYXGeHElQ4Y2BnGq409ncjYWYMxZcms3/bYZtIBHnpON+JQLIJYEk2k/zpGfxnVpk
 XG5YcChJAtCPUMdhhoKLdMWxe+HGDmCDQpCmZq9QpPfvqaFrkdYfg2yyipVQgymqFekHpK03R2w
 lcfEE60UmGrUefXVTsvr/qvdT5NNlgLu4/7UbiboDCWBroT9Arnbo3C8YAWMrOG45/9GaZ4llwC
 GtNeRxSjejZozLSesvQ==
X-Proofpoint-GUID: TkvqyZhVCesJERr9qln7tIMWH1PhZF5o
X-Proofpoint-ORIG-GUID: TkvqyZhVCesJERr9qln7tIMWH1PhZF5o
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b14f5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TUQ72T3Q6eNCQUusxowA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMSBTYWx0ZWRfX6xwlzLQ1ncdr
 0+sfUnU59Lth1wgANK6VYhKwXPzMFMPd34PVWoKFWGP5hS5FFs9vhuWKJQNHHnvyYIk8Uu4gr/H
 LaonYYjX4X+lcB4TP83aXL6mzzmtmYk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_130510_800638_96B4AEAB 
X-CRM114-Status: GOOD (  13.53  )
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

On Mon, Jun 08, 2026 at 09:59:20AM +0300, Dmitry Baryshkov wrote:
> The WCN6851, found e.g. on SM8350 platforms, is an earlier version of
> WCN6855 platform. It identifies itself as hw1.1. Copy WCN6855 hw 2.0
> configuration to support hw1.1 version.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 92 ++++++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h |  1 +
>  drivers/net/wireless/ath/ath11k/mhi.c  |  1 +
>  drivers/net/wireless/ath/ath11k/pci.c  |  9 ++++
>  drivers/net/wireless/ath/ath11k/pcic.c | 11 ++++
>  5 files changed, 114 insertions(+)

This crashes with the firmware that came with the board,
WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ. I will revert to 3
vdevs for v3.


-- 
With best wishes
Dmitry

