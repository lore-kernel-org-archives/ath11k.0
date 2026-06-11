Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CC0CD8C9D
	for <ath11k@archiver.kernel.org>; Thu, 11 Jun 2026 20:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBFyb5D5/OcA3NsvWjkuD3j3aI56Fzwaywe0RW8P2J8=; b=v+d5YFx0t9ia2eh0SoyYKDDKS7
	V1FtfV855+1wjH/bidxPgAF9PXEr41GnCDgq3YJ1gOx9GTfuC+SLAQ6zHvc0zQutRsLO88nYTfwfM
	9osuA+mDlAP8KzDlwl+H4c47Lwm42irhj2uH+zmBO6106XOHGexNxaqN/0c4Dgdg5GOjgg7vZEikV
	LkRuVWnOdquTAKrnbPeIvGh4TBcO52vM2sIzZIFIK0xoizIEGREHR1NAmRDZasETAfW2dD7dWiZ4s
	EWpyzMYR1cNMeLFQyAPLFHpF+ewfFRfoMoCeoTKGyMfNgNJSdxar/9P12M/c+azaSmNIQFsqbwwUc
	qY+5+kDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXldF-00000009zcD-0iXQ;
	Thu, 11 Jun 2026 20:04:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXldB-00000009zaX-1zhO
	for ath11k@lists.infradead.org;
	Thu, 11 Jun 2026 20:04:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3gtK1527781
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 20:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBFyb5D5/OcA3NsvWjkuD3j3
	aI56Fzwaywe0RW8P2J8=; b=Rrl8f5LiVZ14ULaePi85Nft7mMSMQs8lp3FibeL9
	hgf3jBOwaLmDqIn10+K7yfrNozjJHltFgevJt+zUiKh0ddth9r2p6VxV9O183FUa
	fnh6DogbJYuEVmmW6AEX0lTr4WHpTkNswskC3sluWGv/swgLqHj9rBGnNdffW6gq
	4J9W4eX+FlsNBafxJQWOP1EHFoRAjV72/cI0ax1yp4GN+6mvDDOCOLkm8BR+stJt
	goPcM/Mdd4Wn2Dl8yxVE/thisOCcZNwziOFw2YQGvUov3eTeJqctUE4t28DEWOVO
	gaqLz+gJMFBb4izl+7irCKYJOEARPWC1136vGJjH9SyW+Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29urcaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 20:04:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso75205137.3
        for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781208240; x=1781813040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBFyb5D5/OcA3NsvWjkuD3j3aI56Fzwaywe0RW8P2J8=;
        b=I+FBw+C30U7BQxe1b9WDh6SoTHU4ZCqFueSMWxJah7nXKXfuvnVGXzoVm8x4ouPeYY
         S1XaQsHkfa8feq0ulMcU9kkjD2Hivh+nE/eTLyax72adQbox+bZVTMcVB22G7ERlIC4w
         mhuQLcxl0Ngzzjat0BPmVzUIOIqHs75YMlqN8AHpevaK7oMHtWoj3j0qGFC9EbI36Ucl
         rVECMFVXyeXgzF/jLUpBToNolQ22ftqQrISMiK+hxLr3pZh4GQ7uX1zvqVEez2T+1Ajm
         Kzs28x1n8RBN2Dj4qhkzT5eR0jZVp1P4MXUqIvO28yupf/UttigiOLTiEgiBDeEEgVZa
         olTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208240; x=1781813040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBFyb5D5/OcA3NsvWjkuD3j3aI56Fzwaywe0RW8P2J8=;
        b=UiJxSUh0JMLCfDRm7/rygApTs6CXUKB3Zd9C1FNiF+kHVc8QxR4ZxuQS8Fz4JUhKzG
         3FHNN374gYB9vHvG8d/AWA75N3LawZ7dNZTLzjszN/Rlx9raKhPlq+9dSmA9oEWX9F3O
         xrizHws2xQ0xQOlxffTG7J6MOT8mYiX85bXZRMykwxz0q+wqFsy8gpGjWvpABr2QDmLo
         /UHQBPs/vcbHNEQlQbTGIXz43+HrqZ+xh9e9GVsrZOhrsPlKIeKy2a47DfFjNGgzwnP+
         +1FoBEiNr+EleYhQr79XPa/3JX6SWwXqRa0Xc7iYwCNZ0n2bTVKTeGLddHts+HsK7Svr
         1Ktw==
X-Forwarded-Encrypted: i=1; AFNElJ8drYzCiesh0WOUA3CWfzjSC27umqf7QiG16Iervp5ea/hMsfZsbypzJ+ZxvPo+13ZZbBEWcuk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfwR5e23zN2yeiwynaILCqvCBO9DDwuKanM1ghfsR+UgjCX7uS
	566MSI+HgfHM/M++lSKA9uIqF1N4x8dM6XJoa4wlQ+8Wv0lAGB0I549EzwbQ+7GxroOmGGDcJ0D
	Paic9UWIexNssBfUtEt4au8Qh6BkBqyS1k5Y9HID/IoeSTXK246dlvv1Mw7bemeNN
X-Gm-Gg: Acq92OGyX568eZBiDW0SJ4L83ID9gygc//FkGWcOtfT4WrH1OHHMRzNdgoQIE8RgetV
	nXw7g2WJVukWT+ZTF07nrz6Pv+MKl5jDu7nUfE9nwjvKisJ3iZM9M5gZMgF/Pi7utNlXxem1dkJ
	9plxSfOnYkwt/qp3RFtxpbCS5Qv0ihTXPzd2IG7hcLsNfDyad56dM8V32WBbdu+bXnXbhlIvhU6
	mIwbRyaMaZ46BTQXuhqVohncCsvDuzZWExcJVFWSl+gG8Y6D6CPUsioPCLOcREId9aJfIbHwb+m
	8wjhPnuqNUQmglQ5oIv/NaBN4T5VJSqOhNgYUGTSUgPYTCqwefqWeU38/a1LGhHI4Kyqa1ZB6pi
	L3QsJSu3yRhdRlFc/t4R04DaH4wCUTw7dPM2lvl+gwvU/phwqNLU/nPKTQXJQQ0NLl4fa1dFzHr
	YXj1OCSZ/L0Wo+ZRijrxtAbyZrAlWreAWbbHs=
X-Received: by 2002:a05:6102:6a83:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-71d5af2077bmr3143140137.11.1781208239750;
        Thu, 11 Jun 2026 13:03:59 -0700 (PDT)
X-Received: by 2002:a05:6102:6a83:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-71d5af2077bmr3143092137.11.1781208239261;
        Thu, 11 Jun 2026 13:03:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6abdcsm138351fa.13.2026.06.11.13.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:03:56 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:03:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH 2/7] wifi: ath11k: enable support for WCN6851
Message-ID: <qidycur7hkqrccrpbkchztj3p7fgxfhauv6n4ajtxrw3mhhwnp@d64n2nxnlvov>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
 <e5b487ea-151f-4d22-b046-b72447c023cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b487ea-151f-4d22-b046-b72447c023cf@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMSBTYWx0ZWRfX7ABGNSqFrN1o
 f0dwpDn25v+0uFZ5VVwlGjm9z6U226BZ825GqPT6dOZ28gZO69oS5sfLreC8ID/KqWuUM/UQB7q
 sQl9Ec7KW8fHZ5DsnLoXMVPIk7W5deo=
X-Proofpoint-GUID: kZ-osLDyazyJDW19yLw6LLdMYI-YnsOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMSBTYWx0ZWRfXxZ22VnYNZ1j7
 3t4tk58rQFWWQUOjz3POjz6Bf1HUZUxNaSFsUF39pJVXpRGtYQe0S5qEpQ8RGyAinMZ984VVvFR
 LOlkkjxyl8OcbVzNQEtahP5a/Svhammw2GOJEFoUhMQ1QS7IT5O/XcR99QE1nc4bi5nAJ2WBKn9
 7zld5rbA11uSK/n8GgRZlxwH5daxsgdrGPyvMMRQhHJ55t7alR2HCuyPB6+f0YEvPgS94u1ytgE
 Pbdj9cP1t7DugwSPmPPbzSs6Hu2hLIrGkKU35trOIqUyY52sS+agMnZRZFZqJK1ILMeKIVMe532
 qwLsUSyPOCshJXqWMmGAUAyxSNbeMQjhmDoFmKzFJJiF+v+qe3NobiOIgsFP3X/2SnanIQXflCy
 GUtD0jDAIvwlCwDplFYAShZMJ3GtKU0Xv18BdUlpIZI/UVrNi9wj0u6Z9QwWEMaCJeDKeHRP/h9
 6KbOFwgOZQsoVjku63Q==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b14b0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=mbcBxj5cxTrRBoZ8tFYA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: kZ-osLDyazyJDW19yLw6LLdMYI-YnsOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_130401_681386_FE87484D 
X-CRM114-Status: GOOD (  23.38  )
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

On Mon, Jun 01, 2026 at 06:54:35AM -0700, Jeff Johnson wrote:
> On 6/1/2026 2:46 AM, Dmitry Baryshkov wrote:
> > The WCN6851, found e.g. on SM8350 platforms, is an earlier version of
> > WCN6855 platform. It identifies itself as hw1.1. Copy WCN6855 hw 2.0
> > configuration to support hw1.1 version.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/core.c | 92 ++++++++++++++++++++++++++++++++++
> >  drivers/net/wireless/ath/ath11k/core.h |  1 +
> >  drivers/net/wireless/ath/ath11k/mhi.c  |  1 +
> >  drivers/net/wireless/ath/ath11k/pci.c  |  9 ++++
> >  drivers/net/wireless/ath/ath11k/pcic.c | 11 ++++
> >  5 files changed, 114 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> > index 3f6f4db5b7ee..7e997016cf6e 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -393,6 +393,98 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
> >  		.cfr_num_stream_bufs = 0,
> >  		.cfr_stream_buf_size = 0,
> >  	},
> > +	{
> > +		.name = "wcn6855 hw1.1",
> > +		.hw_rev = ATH11K_HW_WCN6855_HW11,
> > +		.fw = {
> > +			.dir = "WCN6855/hw1.1",
> > +			.board_size = 256 * 1024,
> > +			.cal_offset = 128 * 1024,
> > +		},
> ...> +		.num_vdevs = 2 + 1,
> 
> this value is being modified to 4 in:
> https://msgid.link/20260525020711.2590815-1-wei.zhang@oss.qualcomm.com
> 
> It is merging into ath-next today and should reach linux-next very soon.

I've upgraded it 4 for v2, but it crashes the original firmware that
came with the board. I'll revert it for 3 for the next iteration.

For the reference:

ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
ath11k_pci 0000:01:00.0: MSI vectors: 32
ath11k_pci 0000:01:00.0: wcn6855 hw1.1
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
mhi mhi0: Wait for device to enter SBL or Mission mode
ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x6 soc_id 0x400c0110
ath11k_pci 0000:01:00.0: fw_version 0x110c80c8 fw_build_timestamp 2021-05-25 21:43 fw_build_id WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ-1
ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
ath11k_pci 0000:01:00.0: ignore reset dev flags 0xc800
ath11k_pci 0000:01:00.0: failed to receive wmi unified ready event: -110
ath11k_pci 0000:01:00.0: failed to start core: -110
failed to send QMI message
ath11k_pci 0000:01:00.0: failed to send wlan mode request (mode 4): -5
ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -5

> 
> /jeff
> 
> 

-- 
With best wishes
Dmitry

