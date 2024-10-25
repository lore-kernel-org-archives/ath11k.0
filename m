Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8838FD116F6
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 06:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjbBsCeAyf+Le8MeXbzRgLV61MN2s8vLHiDSyQGZHGc=; b=w808GEtKC3i9CFaAx+yhMOKyz3
	UD16lv6CdwU0nQ7/EEnKQ/J8UKj0q2DIJDKDlN7ik92ZVnwLRYcuB9xBAEyz0ov4kKeIH6z7uJzLk
	5/gzEq3vX75VL5KJaCqtZ2xt6otjF9RoaLDa92eaizPNktHimmr8GZdviQr9Lt2UA98vZigYGTfD2
	xGXIpwUKML90pKMKPG1zsMMBETMvkSZsynP6mB9K5n0PQ+wLKv+JbDRdcvIRiCpUp7WOM+ciDbioU
	G0vCaNt2t9Uy7hnaa1EDI6qDWncaj6tGfYu8eZ0vfya3Sfg1ZLWiR1AWoHT31LUbTub8DY4/XECG/
	jspvuDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DNp-00000002cx4-2NDX;
	Fri, 25 Oct 2024 06:01:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DNj-00000002cvo-3qdE
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 06:01:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so2754576e87.2
        for <ath11k@lists.infradead.org>; Thu, 24 Oct 2024 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729836066; x=1730440866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjbBsCeAyf+Le8MeXbzRgLV61MN2s8vLHiDSyQGZHGc=;
        b=Y2IFrDrIOusPaBx+fql9cSuaDJtVwkm+10akrVy1wLfvDbslG1T6T2Eq1WjWu2tbT0
         /H4SqBi1Bkw1Nfjc9AyHInV4VEcg6O7MOSk1XjO0stfQA2ajAKzkblKOqG2YLTYTzfyg
         bGHvYACochSc8CCM5JWQzs1zF3jultUovewJTuSDhq6dd3uny+JibcmFIW3h9XBHiDdR
         GXNw0cLl5SqCCWTxQQIdpSEqmzi5eoj7IZqP4Gc1j8kEyib4sofA3kL2ca+NsKLxoe98
         PTHJmLKcgM5AA49yT431lKq70Sqz16zgwsMa/GZwALGc+bZEOFAvy4PYZPf5chz+rpQC
         eiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729836066; x=1730440866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjbBsCeAyf+Le8MeXbzRgLV61MN2s8vLHiDSyQGZHGc=;
        b=ZS3YOnfbEBzU0qQ3Sko+Tr69aMxqZkPJnX84rBZCS990P7Wjnku5Ntw6m+Ruo66+oZ
         rrj9EMxmHzcBrP0Dg3ezEcw6o/qt0i6SGE6tgayTsBENukyIFiJKOx0WV3CmyxAcZuet
         jGTQLQzf3Zbtf+TeEED2qhUlKkNTUDEFq+tvmIsIlYFVDCDhrkb9f83v8Znx0YtDvWVH
         93XRvhX4DDNwkcF1moSnSOrliaewLHoZNpD9EUeZyvSBLuRKuVMMioJbN1S3YLGQo6Zf
         USrLSqZHAwK3YZdeLdS5Tr+EIs0akLpqpX7zJedQ/KD2OEX8+PJwlyMcZ6HbVXOzEWh5
         5uqg==
X-Forwarded-Encrypted: i=1; AJvYcCXyxRk17JRQsXB9E6h8SLKlSDZdyyg67UfNdv/nBZZK2C3AOXWyehedH7fS0sZ3wp6e9Hi252k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjoeqvT619JbXgd+/qwdWVayhSxaOkLt8FpDo+fjjItpQ2U/pH
	ISQwSLFyvEJ4do15mkforRnlxkSqq0Q0doY1p9L0k3y3iiAUutPzKJh7b86bE+s=
X-Google-Smtp-Source: AGHT+IGW0DGFqF4GXZuZDbx8GIO1iTPAdVwiNcEj3OF5vaunDtCPGMMbC7oqaGNUsFQF9eF0TfXlpQ==
X-Received: by 2002:a05:6512:1282:b0:533:4785:82ab with SMTP id 2adb3069b0e04-53b1a315e50mr8487448e87.1.1729836065876;
        Thu, 24 Oct 2024 23:01:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1df2dcsm63515e87.243.2024.10.24.23.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:01:04 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:01:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
Message-ID: <ig3m3sgmnkgfmwrlglundhqif6rygzl7uh7rzoemrz3yxgvfpc@35a323mw2wbt>
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
 <20241024002514.92290-3-quic_miaoqing@quicinc.com>
 <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
 <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_230107_995028_843B7202 
X-CRM114-Status: GOOD (  32.24  )
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

On Fri, Oct 25, 2024 at 10:56:02AM +0800, Miaoqing Pan wrote:
> 
> 
> On 10/25/2024 3:39 AM, Dmitry Baryshkov wrote:
> > On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
> > > QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
> > > IPA, thermal, RAM size and etc, so new firmware files used. This change
> > > allows board DT files to override the subdir of the firmware directory
> > > used to lookup the amss.bin and m3.bin.
> > 
> > I have slight concerns regarding the _board_ DT files overriding the
> > subdir. This opens a can of worms, allowing per-board firmware sets,
> > which (as far as I understand) is far from being what driver maintainers
> > would like to see. This was required for ath10k-snoc devices, since
> > firmware for those platforms is signed by the vendor keys and it is
> > limited to a particular SoC or SoC family. For ath11k-pci there is no
> > such limitation.
> > 
> > Would it be possible to use PCI subvendor / subdev to identify affected
> > cards? PCI Revision? Any other way to identify the device?  Please
> > provide lspci -nnvv for the affected device kind. Is there a way to
> > identify the RF part somehow?
> 
> It's rather difficult, for WCN685x, there are multiple evolved subseries for
> customized products. e.g.
> 
> QCA6698AQ/hw2.1
> QCA2066/hw2.1
> WCN6855/hw2.0/hw2.1
> WCN6856/hw2.1
> 
> They have the same PCIe ID (17cb:1103), the commit 5dc9d1a55e95 ("wifi:
> ath11k: add support for QCA2066") reads TCSR_SOC_HW_SUB_VER to enumerate all
> QCA2066 cards, it lacks of flexibility, as the list will become longer and
> longer. But it's the only choice for QCA2066, as it's customized for X86
> platform which without DT files.

I guess, this is closer to Kalle's expectations: being able to detect
the hardware instead of adding DT properties.

> So for MSM those have DT file platforms, like SA8775P-RIDE/QCS8300-RIDE both
> attached to QCA6698AQ, we can specify the correct firmware to
> 'ath11k/WCN6855/hw2.1/qca6698aq', so it's not per-board firmware, it depends
> on the type of the products(x86 windows, IoT products or AUTO).

No-no-no and no. The firmware used must not be specific to the product
type.  This is what everybody here is trying to avoid. Please try
following the QCA2066 approach instead. And note that it could use new
TLD as it perfectly shows itself as a different hardware kind.

> 0000:01:00.0 Network controller [0280]: Qualcomm QCNFA765 Wireless Network
> Adapter [17cb:1103] (rev 01)
> 	Subsystem: Qualcomm QCNFA765 Wireless Network Adapter [17cb:0108]
> 	Device tree node: /sys/firmware/devicetree/base/pci@1c00000/pcie@0/wifi@0
> 
> 
> > 
> > Could you possibly clarify, how this situation is handled in Windows
> > world?
> 
> X86 platforms use standard m.2 PCIe card, and it will only use the default
> main firmware files, as they without DT files.

So QCA6698AQ cannot appear on an M.2 PCIe card?

> 
> > 
> > > 
> > > For example:
> > > 
> > > - ath11k/WCN6855/hw2.1/amss.bin,
> > >    ath11k/WCN6855/hw2.1/m3.bin: main firmware files, used by default
> > > 
> > > - ath11k/WCN6855/hw2.1/qca6698aq/amss.bin,
> > >    ath11k/WCN6855/hw2.1/qca6698aq/m3.bin
> > 

-- 
With best wishes
Dmitry

