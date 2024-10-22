Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A2FD2C559
	for <ath11k@archiver.kernel.org>; Tue, 22 Oct 2024 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDLtvhMz6PcWfZhVz6kUWAuewo8GBV/2rwOJwr5Q+iQ=; b=Tp+pjaGr3PE9aROgXgRVa5mhxh
	wE/3dHtcCRfIjNdvyPQX/Wi+v1Wzs7iu7ic56bgr5ODgBIyq6pZ/jXr1eIFJgdqyA8k1XvTc+tllq
	PtR5sAGyYGmUbZ7ipC0ZgzTmfE3QYn8bLObxG6LS9TSuOobifag9zhFt9Tqan5g2112HYR4yvoxtj
	1jTPGBJv2YBQ8wv9ZNbhnV9uqi/WpDVes82QuEC5vaPBBSmFpNeMiNsFkvVJg6BSIY7TX6Odcp4Je
	0XWSWG9JQIUj6Po6FOvLsRtJ6UP/VKihFgQlBBXX/MxpekZlmMqtgk4Zv5Ylt015SL+rpHSS6vfVZ
	/XW6i3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3FVs-0000000B2tw-2lBo;
	Tue, 22 Oct 2024 14:05:32 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3FVq-0000000B2tT-2hzv
	for ath11k@lists.infradead.org;
	Tue, 22 Oct 2024 14:05:31 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-82cd93a6617so214023039f.3
        for <ath11k@lists.infradead.org>; Tue, 22 Oct 2024 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729605928; x=1730210728; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cDLtvhMz6PcWfZhVz6kUWAuewo8GBV/2rwOJwr5Q+iQ=;
        b=HK0s2UnSuCz0ocdKTEzc7+MmefO54sZqJ6oswszzzxeWqdaFTDrHJ6tPVv+GPMIlbe
         2f2Hlt4KhCJs6PPzyGBJE8E8u82F7B3vxzdb2QDjFLkMQr/nEiOs16IMsoBLaVcLLcWy
         2HJlUdrsjWKlnWfGRwqUw8yFcExEa/W+oZdo51pKi9wTggD71DOooFr+zm7EpRmNZl07
         ZCaFynUkLo7+xldhhuOl0nsG727i6fwhO+/Vd88sqjau4T0Bvey1YxspE9Uh0wD4m5Wm
         BBseLRGl+qpayRfw/uprWfr149hP/45gP0EWIHl3Vslk+CVH2gVHajvBtNmeGJzWsr3M
         tfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729605928; x=1730210728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDLtvhMz6PcWfZhVz6kUWAuewo8GBV/2rwOJwr5Q+iQ=;
        b=EDJz6zpncUgWzrTZhUu55mYtaFOqMx2b6kdh/DcTUJ7GLoj15GETtIECn29tNndjmh
         fgZTdubk/Iov+Mdy7HTrqpjgF4Q6EhY/Tbd0+7dMGaDn/M6sbUTHLxcOCi1/uETUEjj/
         J+yqYVNFtBZZE5jcor7tGD84hCyS+eWGQo15N7V3zybnXmqsmMh8RY3ObGbxfPPU02eO
         gWqTPUkvF+puxEmDRWntcIJ9SnppZp93eW7gB+m6CWrLqw6I9FIsF6IF4v8NSlgRh8UZ
         YctFGZt+gwCiUqZFAOpld/YKbDsljD6Q0USwgYrupxHghr62qeg9hSRnredchRjzc4kd
         v3/w==
X-Forwarded-Encrypted: i=1; AJvYcCWvJoX+jLhQ3R7WsbBPdkwxV1XOFsvxeYGN5zH3lporJ16bu1QLie+hCeWk4AQqhLLyWjv2TNo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGdpBBSfWzPCRjvej35s/vZQD9k0sUn7C8AOwM6omb4WYqt9Ow
	pvIUh1QIhj7q6tTyqGLkziuE9rOsulgK+cr0jtEkKCfz+JozXZb8fr/RsnglRjtsbOjBhDD919J
	it8kd1Gid4TzBl6jCyPSMaPNo0xJnlFlcmOpY+zhd40LJNIMh
X-Google-Smtp-Source: AGHT+IFpmhM2z2KDin6GRhjxZIQ5R+mLzT187UDQAB/1orWo3bN3jQ1rEzWwIZFAogs3JWkBJ+YU+ZNAkgJe/aJbZl0=
X-Received: by 2002:a05:690c:f8f:b0:6d3:f9a6:e29c with SMTP id
 00721157ae682-6e5bf9a0846mr144026337b3.12.1729605366851; Tue, 22 Oct 2024
 06:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241001033053.2084360-1-quic_miaoqing@quicinc.com>
 <20241001033053.2084360-3-quic_miaoqing@quicinc.com> <smgbishqbin4kcpshqvue3ivvfko2l6rj2w4ikwydosbkq6kde@pdbzhklj7znm>
 <1c5f5c93-db06-4490-af2e-bbce2d184c94@quicinc.com>
In-Reply-To: <1c5f5c93-db06-4490-af2e-bbce2d184c94@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Oct 2024 16:55:56 +0300
Message-ID: <CAA8EJporsVmyhvYV4QDnTJPh82A-JZz3u1RkChe=MumGidmLSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: add firmware-name device tree property
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_070530_713283_5FC9A44A 
X-CRM114-Status: GOOD (  26.21  )
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

On Tue, 22 Oct 2024 at 13:20, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
>
>
>
> On 10/22/2024 5:57 PM, Dmitry Baryshkov wrote:
> > On Tue, Oct 01, 2024 at 11:30:52AM +0800, Miaoqing Pan wrote:
> >> QCA6698AQ uses different firmware/bdf/regdb with existing WCN6855
> >> firmware, which is customized for IoE platforms. And the 'pci-device-id +
> >> soc-hw-version + soc-hw-sub-version' may not be enough to identify the
> >> correct firmware directory path.
> >
> > Why is it so? What makes it so different from the existing platforms
> > that you can not use WCN6855 firmware?
>
> Just as I said, a new customized firmware for IoE devices.

This answers the "what" question, not "why". Please provide a reason
and a description. Can the hardware work with the default firmware?
Does your custom firmware provide additional features? Is it just
signed for a different SoC? Is there anything else?

> >> The device tree allows "firmware-name" to define the firmware path,
> >>      wifi@c000000 {
> >
> > You are describing platform node, while the commit message talks about
> > the PCIe devices. Could you please clarify, whether it is a PCIe device
> > or an AHB device?
>
> PCIe device. The change is for sa8775p/qcs8300 those non-AHB boards.

Then why are you patching the AHB schema and why are you providing a
platform-based example? It makes it harder to follow your arguments.

>
> >
> >>          firmware-name = "QCA6698AQ";
> >
> > Could we please follow the approach that has been defined in the commit
> > 5abf259772df ("wifi: ath10k: support board-specific firmware
> > overrides")? In other words, instead of creating another directory under
> > ath11k, create a subdir under the WCN6855/hwN.M/ which contains your
> > device-specific data.
>
> Sure, thanks, will update.
>
> >
> >>          status = "okay";
> >>      };
> >>
> >> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> >>
> >> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> >
> > P.S. please CC linux-arm-msm for future respins of this series or for
> > all other submissions that concern board-specific DT data on MSM
> > platforms.
>
> ok.
>
> >
> >> ---
> >>   drivers/net/wireless/ath/ath11k/core.c | 12 ++++++++++++
> >>   drivers/net/wireless/ath/ath11k/core.h | 11 +++--------
> >>   2 files changed, 15 insertions(+), 8 deletions(-)
> >>
> >
>


-- 
With best wishes
Dmitry

