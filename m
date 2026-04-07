Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2CEFEEF2E
	for <ath11k@archiver.kernel.org>; Tue,  7 Apr 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2wMrZ/z2PzZnfeKqTuUJmhmmuTVpcpoive3zz4Ny2Y=; b=jN/BRwh08qFmW1Dld/tlXF5/mZ
	gfm1jGX5RZxQfpjjcncpEQDB8nqjPTnln0jiOM5A0NW41mkH3/Nw3/Haf9CaCI5hMpEYKTuxuBlqz
	K9iOllLYHDfBOmJ4VFA4mDLurbdmloTs5mxQZ8EyUUqboDFIWyARowxSUnwzbFkX8TvXRdz1TMH8y
	hu1dUTdF440TCZSYcTh/sjTHzCbfv/aQJ3mgQV1NKcrqcr9hKpQN8gSTqk+wKCWlfzqhLp2JJ4x/+
	nwlx/3JWSxaFIVEKX9/+91+iclJ7q9jTSlOdYttvO/b0V2ruJ6NEiflLqGDLAV4LUdZag4Xa+gJFQ
	jmOBL16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6CR-00000006UNI-0w61;
	Tue, 07 Apr 2026 13:10:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6CP-00000006UMs-00Sz
	for ath11k@lists.infradead.org;
	Tue, 07 Apr 2026 13:10:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Cxarn2550330
	for <ath11k@lists.infradead.org>; Tue, 7 Apr 2026 13:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2wMrZ/z2PzZnfeKqTuUJmhmmuTVpcpoive3zz4Ny2Y=; b=i3OUms9GyBpWNaZ1
	EoshCvAi43BYzbLs2Bjk8/7c/8W5m8GSvAA5xuCF0AzvL2RoDCRLXmJgGfcqrZ9d
	256buWjegjZAuvNo+Zvsg2toXA8lLvNYDTBqXK5m06XCmWu5wr8HmvqIYa7DDedx
	pBItUVl8pkzgvmJbPALM+G1FsjKH9lbJnc/tUnP7DVNOduNumuRfGT1VqsLN2YXm
	zWqHsS5IYwhGP8Q0ip2EkPN+B9yPdWRgbsDlPVJRVUlbSNrV+zKpkXKWQ6X5bYIW
	QY+7np6KSy8iI5m3zhCq4hyKiqJ0z53fyn5gBWid1k7PnKJWbcCo2BGKoGEgzvC1
	aZZ2EQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreaucf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 13:10:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so236601137.3
        for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 06:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567431; x=1776172231; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2wMrZ/z2PzZnfeKqTuUJmhmmuTVpcpoive3zz4Ny2Y=;
        b=H6ibt+jBb00zFJ4j3IcuEC7K2WIWwlWV5jHN2Q3UNP5nS3b52v7b8hkIHs9PkP9qBi
         deuJRBthPAsqAdfBKRJTTa1PyU9pvIKT/rTr+UA81+E2Nhv74Lcx7ZO1AbYunsoDv1tq
         8IyNSbBWCVjgU6/HBaa5npCW5XO98iOaKdYC7+V7IKe7NrEeDa1nsQ3FB4p3KfvRIFyE
         zIQqGhii535hp/yeU9VnTXHHd++2ai2Ys+VkFS9D+gIazzFVyp6czfMNzphKoUuobS6S
         jieJw9WMNAL1ayFqzwr+eIgBBpnRF9HKfr5bRMAYwS7fwP0M5y7qalfj+hlWua+umRYx
         75cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567431; x=1776172231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2wMrZ/z2PzZnfeKqTuUJmhmmuTVpcpoive3zz4Ny2Y=;
        b=aA8TrHxfOiVdihcgW6tmGqwMuPTExns9+0WuaadNw83N+JXUa+YE+GklkjbE53yp7/
         9ivOkSgrpPOQse5I18AxfyqtxmJQTXmPT9h1Jhm/BCHuOAtHzUOzym8NYNv4Q8OakChI
         miTVJkQsGWFwm9PUODCeDultVWfMMCA5AXn1Qjy2NDiEzfVdhREs3AOLQoblDUEJlQzu
         tAHk+9+WTV4/1VoHUKEDuGMa6tKtoTFHBeSGLHIJ4lY/qwJ+ia0D0BTQJxRWABneC2fS
         bCo+jnNkePCs19kwL7IwGiKdUrILdWgyJSUsRO56SMGJcgXjOt72XWnEwVjcV9/rLnR0
         YQzA==
X-Forwarded-Encrypted: i=1; AJvYcCUKn2px0nl6nQBpQ/KCVB+IHPnkJ4nyGulxkg59QRjxzYYnMPSIcjmwMHByUX4DCg3xMG1YL9o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGnixjo08pqTz+R1QEtJLYdQUFyrmn/9UgUWBCqTe5ThXgYCZS
	STpk0p6Agtbaivm8fKuxDxx7kQvoZiW1irQVyEhM0ojep5Ffx9oC5abOI7ksL/aQ5ylmPW7uooE
	YKfHFzliRXNJeb34WkgFygKIfBiBgfPAVKmGj3ghQirndG22zbeNeMBJnt4yVHrHu
X-Gm-Gg: AeBDiet/Wy6gAundXF/NamA6Q/a23oG9HWXGnsTMslGjs+VpCeLCPJduGqHh87clMwE
	ixQ+0mAWO7f6HAMdbU0Y9okxGrgOcvOpysJ/FDd7Dav2XnQoptORWxuy9omLZuUJeQZPp/QigqM
	UizZ01o2K2QBohh9E97ieMKJQL9Kd4m/ysbGLbNyYMg9vdlgFJPlv/fVz9P9nKKXINhEpJPkW4i
	8xVSCiGXG5LO84mkORwH5E2zdnELgmJbNv+Pl5PRxcABCzJG66DN5b7kpZDy1LN3j4nsYUu5U5b
	jioycvFpw1PEDIgBOWstGZ3scEO9apsqNOfvVoR2kjj/ctKtlD5WF8RYwnrXcoj/ix1lWFVCMIU
	9q89cT/Zm0IxkUzQBjcJJZjd5xIaLUhv1QKe6OyRojerFKM/Z2BWouJPUPflkJDz3s3mv5penVI
	TQcg0=
X-Received: by 2002:a05:6102:21ac:b0:5ff:d9e2:3f7a with SMTP id ada2fe7eead31-605a4967393mr2047981137.0.1775567431117;
        Tue, 07 Apr 2026 06:10:31 -0700 (PDT)
X-Received: by 2002:a05:6102:21ac:b0:5ff:d9e2:3f7a with SMTP id ada2fe7eead31-605a4967393mr2047949137.0.1775567430625;
        Tue, 07 Apr 2026 06:10:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c31sm558300166b.37.2026.04.07.06.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:10:29 -0700 (PDT)
Message-ID: <dc2dbc10-e1d6-4b1c-8903-7c8c612517ab@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
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
 <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d50248 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=fx5w4MVDiXKpHOpY66wA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 1DlNMNg6l3xdPyHTAOHS8DRmsX8NphCy
X-Proofpoint-ORIG-GUID: 1DlNMNg6l3xdPyHTAOHS8DRmsX8NphCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMyBTYWx0ZWRfXwWxukJDQ8TRw
 6bCEEb0FukJkKEvAwyZye7ynh6ksEr/91z2P1KnDHCqOuWkN8y4aoDe66D0UQq4YMwSToArtx+v
 2DpkqGE0rZdT/umjxG6dbLGL4MRAa1OJdKscprSWjE0mtHmSC5n3CfslFGlG6RxfBfshFW5MYyY
 fkVGJSlocx49ecrR9DxBhkjLUVw4KfQ3/IM0HnJ0QJviafxGZflwV1bdiqwlT6BJTRkvgvckszX
 G9eK+AgZsU6QXK5pF+j/GTsEcJbprArSufYmxEoqpvF0oVopXCFKtiXN//BWe0Sh/T1X9crHI2v
 tf0ZFJNDwJe2WIK86Aj/tzLYZn40siVYRfexYTdQQ/mrAs1Oc0QS/r1UyJC+ZuVHCtikq0N6S/w
 uSdGupCSgYDC1ZgwjnoTwIQq1zGIgqIaPC40woN1nklJR11Ny9ayP+nHSpaXpp+PLsr+2F6waBC
 TjJQqUQlJDHmGhgTSSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061033_083542_73B931AF 
X-CRM114-Status: GOOD (  12.24  )
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
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +	wcn6750-pmu {
> +		compatible = "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";
> +
> +		vddaon-supply = <&vreg_s3b>;
> +		vddasd-supply = <&vreg_l7b>;
> +		vddpmu-supply = <&vreg_s3b>;
> +		vddrfa0p8-supply = <&vreg_s3b>;
> +		vddrfa1p2-supply = <&vreg_s2b>;
> +		vddrfa1p7-supply = <&vreg_s1b>;
> +		vddrfa2p2-supply = <&vreg_s1j>;
> +
> +		bt-enable-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK1>;

nit: I should have caught this.. intriguing order of properties where
supplies are topmost during r3g2 review, which is presumably where
this originated from.. not a big deal though..

[...]

> +	bluetooth_enable_default: bluetooth-enable-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;

nit: you shouldn't need to initially actively drive the pin, a
pull-down should be sufficient

(if insist you do, output-foo is usually below bias properties)

with or without changes:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

