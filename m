Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8367BCD98C7
	for <ath11k@archiver.kernel.org>; Thu, 11 Jun 2026 19:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ET6MuyER7wxqL0ASDlEV4k/MQK1DNFn9BvrzLC069vE=; b=OafpApImD9c4Xg+Hi80riYhqXE
	th8c1vGg52LMOCTQNlZkGZShjjI6qFZOHn0a26h49qVTJFuhbAGbnbLRTqRNNygx6nvLkEY9Zwvw9
	NSsXtC4zRmTagYCne4Taet+fiS2Pz8OwuXKbksaGTskm4pwai5utagYsPRkKRiLCM7oF/nxPrwDcB
	qa1xruK5OVO7Ubo7w4SLi2KIVXjRXcHjNtiYo0NvFST9oGW9ZddK3cZOP1xlVj1awTBnRqsF4Hzsu
	4ni4Xjlv4hSL2d4Qt4wQpNAKrsYqvfSswIn6rI/8ewR7SgWwSqUBVMyNQ4cPn4dAtiwR1m0AFyhkf
	EC2vhlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlKr-00000009yIr-3eu8;
	Thu, 11 Jun 2026 19:45:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlKq-00000009yIW-1JCv
	for ath11k@lists.infradead.org;
	Thu, 11 Jun 2026 19:45:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3FqY1478861
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 19:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ET6MuyER7wxqL0ASDlEV4k/M
	QK1DNFn9BvrzLC069vE=; b=NsgxwsD3g9/tq9EhZ6i+/tcISCfFF7/04AjnxCFQ
	Ml6KjDCaTQdVQ7/O+jrLiaCqhWqWALIh+4xScFrNXEJjaxa1e99uVeRza6pIO8kS
	6hcsGgFXizRuscbj97lpaijwrWQV32/x0QIgBLPfPHqms3EOJ/heK1CG59rjJks8
	XV6fgwZKlJCHBOm0dRHCYTgP9E+a8EAYjLoul37S9v7b3hIxpOEZW8RMrrxqWjId
	vv3NZrNwStAj/Ls5lRcxQqAhDm2KQ4s1hfuEc5mXEJ+IjcJuAYgagI1a3Cklagkc
	U/PqeV6jk8kaHrttj5udUw1psw4Zas8zGTIZ5y9LooMAnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbgn1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 19:45:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517d766e05aso5181581cf.0
        for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781207102; x=1781811902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ET6MuyER7wxqL0ASDlEV4k/MQK1DNFn9BvrzLC069vE=;
        b=FZyb/dJ3ucH4HvRV2GfWl1VTsbdMd6Q1CsRRSZhOm2isVm8keEe6AeIfVvvwJAikmx
         FGV/DM9kStdrqexBEkDyAkJwG5SDZpfJITXvwPyOlNJ5CZHJJc0RgqOKcqUwVcTFhp9P
         qC1NPbKB5S2uZjk1HJEQufj8ar0Qq6mi6mhWf1CM4rwdj5XTZSZAmpeKr22T8flPgnAy
         P1gQ6UohImFhqXFbDnpOFF3VAQlIWklMUQV0k1E+0RtfHiHZaXm3Ps/OelEPSd5XQEdi
         92C/Pkw8MEVRcVupOLO3BNlx0nrnd91WYOj5VHlDibup6OzJmjmLd5LOU7/eG1kx41MM
         COYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207102; x=1781811902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ET6MuyER7wxqL0ASDlEV4k/MQK1DNFn9BvrzLC069vE=;
        b=OLm1LG7BfI48m970YdLi08kClXRXgBpewu4x4FHraK0SMxHYilLXGCcNyemKliuDAp
         gTajGUwWoySLp1VGu+d41TXjG2TWLTPYDS7DCPBXox7E9soH2euBZpSHzBEELRsgYmpy
         hmSFlsdFcJEemMpPyEN1AE6yDa1VHK+SJTltWbSQequJdjjd4ovxISY6naYON5zUnOzy
         6CjqSrpE8zQTmJEKIfTW1/oompmUba10uvYK5g3HFQOkkUFNCJb7uRfJTzNiypEeY/nb
         jeZ/5ZjbrRDPyBktdDDe+EPx2pFXyfCnS+3ASgahHZ4IkQDlWDvRR1bOkozqD+SyqDn5
         fFxA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZXtAQcsR/aiW0iPqzjZ5QT3scpaeQZ44NzWq5unlFeGSmm95RlY6FxLBtt4v+GGf0pAXoJGI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3xotqpsLv3q6EUN9QViNgKZLqFawwTfBC44GAIv5cRqATBhif
	AK9fyAOBZYfOMjIMEg8bc3CoZX32zDTOP5Nv85/NKWKoNW35Pn3SV6FLApHXt2p6REP/7GZl+Gr
	c6qT+/tv9u2kfb9rHqhWvgxYv4AkHuS/o8rl+Kp8AjhAlnaG1SvyMP2b3fc6UDf4V
X-Gm-Gg: Acq92OFvmMhuInh57YZdRsD1ymUKL2+3Njdmj72T5FsBQ5TN8NayXmussgONIMv6hVL
	+Mu21KKxQyRjhMRrpsMmw+1oKpYvcPpDkIBgTuprLQLCu13qruXQ5nOKg98yE1eDvbsZl9neFD/
	02dAyf5qGUOfGbSRYxfl5Mb8lVXIVgeJpsIqQRLS/0zXNvT/5lQUFqh/JC9SABfkic9Wl5h5h+x
	RKM/K5Tt9q+eaw9VCddJY5GmjNA/1Nbc23xtnY2gbcUviYz/hFxWiLEnNOOUA6cFDbqOnOzWPfn
	m4PCZMk4zDnbkDsclD2+G3/IYMTwJiMkMoY8k0O5egbed/3EorLZpW2sqRDoi13XUjjeMNhEfpE
	NZsvqll5xE33mR+v0t5U55mE/jatIKyEP6VTqqi4Eo/HRe6jQc7bYyz7rL6RXro8vSIK3phy8Ng
	ztSutv3n8bixhTORRjXDeqmR9aDPVRlnAEocQ=
X-Received: by 2002:a05:622a:14c8:b0:516:ddfa:b6b9 with SMTP id d75a77b69052e-517fbe619e8mr1984871cf.23.1781207102434;
        Thu, 11 Jun 2026 12:45:02 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:516:ddfa:b6b9 with SMTP id d75a77b69052e-517fbe619e8mr1984411cf.23.1781207101976;
        Thu, 11 Jun 2026 12:45:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cb46b25sm103098e87.34.2026.06.11.12.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:45:00 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:44:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
Message-ID: <dz4qovpquxgynnzviqg6g23oa2o3trlkznremnmlqfnlj3b62x@oqgcuvalfcph>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
 <955691e1-e40d-4584-861e-8f29db4ba8a9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <955691e1-e40d-4584-861e-8f29db4ba8a9@oss.qualcomm.com>
X-Proofpoint-GUID: yjUvBuEar8Q9IvOnM42EXeUhwLaQouoi
X-Proofpoint-ORIG-GUID: yjUvBuEar8Q9IvOnM42EXeUhwLaQouoi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OCBTYWx0ZWRfX0YDjQZJVAnCh
 RPnHTcjxaa/9hH8CINchYIdkWVsC47E1h8ONq35B5W/bPsSu0WPdkONxFSJK5JHPuU5VEQWA5dH
 wmmP9gxYnRT9IyqASZW1YbpGO4e27so=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b103f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NvgA2eVT_OJx7K5CLicA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OCBTYWx0ZWRfX8oSyHIB5jvQT
 ut/eSDTlUVybEhaFXSmgv/9k1UBglQX5AZwmfPRQztUe05RV+HcRiViV9cjjOxz1avd93B1h9Ud
 UuiFAbPEzyBJk+meYsFppzYl5owQbasJOjZNKIq9QAP3KYj+kyXeyUan6DyRaAP9Jq6+fCQgK7j
 sv8K5AbdZJh7WHI1dIDJ7DW7buBos1BGKPBrmO0syJpA87oqXePgRWrs9l6WOhaUBe6YB3YjbjC
 mlG6fvIkJzN16HBz7chwkqHqEecXOByYuKdYXgV0ZE2fKhon/wc1rfRA0pp5dWfzcB1iiJkeXUe
 sdtB5ow0Jvpq/A0DtZlCWxijgBfY+SuEoXCzfIgmfFtCzhGPjkHZwanaugim7okINg5oaeHfUog
 v3Yjx+AocMZayihLvy7r3XmAmoKpv+mAGdSfSvYLafEQ1vY1rS2R4QnxGoXwQ8s9XSyyFebDq1Q
 bLf21X7R6oW39oiEqDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_124504_483679_32999B75 
X-CRM114-Status: GOOD (  17.84  )
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

On Thu, Jun 11, 2026 at 02:09:27PM +0200, Konrad Dybcio wrote:
> On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
> > The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
> > version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
> > parts of the device.
> 
> [...]
> 
> > +	wcn6855-pmu {
> > +		compatible = "qcom,wcn6851-pmu", "qcom,wcn6855-pmu";
> > +
> > +		pinctrl-0 = <&bt_en>, <&wlan_en>, <&swctrl>;
> > +		pinctrl-names = "default";
> > +
> > +		wlan-enable-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
> > +		bt-enable-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
> > +		swctrl-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
> > +
> > +		vddio-supply = <&vreg_s10b_1p8>;
> > +		vddaon-supply = <&vreg_s11b_0p95>;
> > +		vddpmu-supply = <&vreg_s11b_0p95>;
> > +		vddpmumx-supply = <&vreg_s2e_0p85>;
> > +		vddpmucx-supply = <&vreg_s11b_0p95>;
> > +		vddrfa0p95-supply = <&vreg_s11b_0p95>;
> > +		vddrfa1p3-supply = <&vreg_s12b_1p25>;
> > +		vddrfa1p9-supply = <&vreg_s1c_1p86>;
> > +		vddpcie1p3-supply = <&vreg_s12b_1p25>;
> > +		vddpcie1p9-supply = <&vreg_s1c_1p86>;
> 
> [...]
> 
> > @@ -373,6 +437,13 @@ vreg_l7e_2p8: ldo7 {
> >  			regulator-name = "vreg_l7e_2p8";
> >  			regulator-min-microvolt = <2800000>;
> >  			regulator-max-microvolt = <2800000>;
> > +
> > +			/*
> > +			 * This is used by the RF front-end for which there is
> > +			 * no way to represent it in DT (yet?).
> > +			 */
> > +			regulator-boot-on;
> > +			regulator-always-on;
> 
> msm-5.4 maps this to bt-vdd-asd-supply (asd being a keyboard smash,
> perhaps?) - what is its actual use?

WiFI/BT RF front-end, a separate chip containing amplifiers, couplers,
etc.

It is a separate chip (or a module), it is not powered on by the PMU,
etc.

-- 
With best wishes
Dmitry

