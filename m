Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184D9EBFD20
	for <ath11k@archiver.kernel.org>; Mon, 13 Apr 2026 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtkvQUwJwxJbSQun1xp3UJ1EVjDwjdDQxfbDiJ20NYU=; b=YScLlPX/zPHn9z3z5Zg9DlYuWs
	PCNYz5NauUps71rki0lY78Oz10FhPMYJXjyfLWwIBYRzmQpKVhdEJu8ovXxZIR5wHZm+zsOzHR6+a
	HPuNx+KzlBcg26R6iSTCabvi0Ie+5cj0YdkNrUX2X9yw18FOtH8sDphFZm90EZ4reDqWLv4TQm3DQ
	iR08pHF+eWTAmTLnn2TM4hyrcQR4wEvDIMbSiiak5qAVbsKq3KRbxOdQk9erAME0KNJGiC61ZqgMy
	CbAA6jZ4ATRhAi46fvHqpKbAyPjahkoNKn+TpV+H+eaNO3UheZPF7FWd2+H04ulhLwiPgaKzcQCG4
	g14mV1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDeY-0000000FNJT-2UIY;
	Mon, 13 Apr 2026 09:32:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDeV-0000000FNIX-244r
	for ath11k@lists.infradead.org;
	Mon, 13 Apr 2026 09:32:21 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so56267005e9.2
        for <ath11k@lists.infradead.org>; Mon, 13 Apr 2026 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776072737; x=1776677537; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AtkvQUwJwxJbSQun1xp3UJ1EVjDwjdDQxfbDiJ20NYU=;
        b=s+1EqxTRZIXRPnn8Ee0BUmBlMHb64vEghSYIXFbRgtCL8OH3uCZqEkVZGY9wDR0v7P
         Jz+k6ljlG9n7kMCJMZe+m1Ov9fW9H2w2pVzN4OyQYvJqx75Ez5zZnEcBhR6rdNAc8KrH
         yuxJcLuIbSvz2rJpZ5xSv1Cit7Gxl5YPJtR6NP5vBdf+6vewKD6k+eDr9g7C+iDzW1O4
         7hXr3Xx7+K8cAZweOIr13a93KndKMetRRTpSOCwy4iMacWw+BIVMvOCmHEHx1Jqho82H
         djCsjK72eITtJ5NV7i3wDnqqipkoeFsOd1grGRFw0LWQdfLyb5cBWm6zrd9gP7NGNz3U
         tSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072737; x=1776677537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtkvQUwJwxJbSQun1xp3UJ1EVjDwjdDQxfbDiJ20NYU=;
        b=jDRtZUegHHHgLtx+q3Drxyio2WDXPKZkUNmlxBROwgVTGxsXuP+7gkfQIziDOJWNV3
         5QUFaWctWQLtpTG7Ka5EMwFxYiK+eMhKPuQZBPDD8BmTwySQiCg+lrPMf38BY32qNgr1
         EuCRTRXICv5hv0YdDbTz2yIKffk3nvwcyPQKUV79+H79cEUgXRAKa1ms/QgbpiRsEP+s
         /FE6Qi+SRDL7zjC6iQwwyT5F9R8fjTWvZfpfymccJyeJcfjWAcsGc+1z7huUWMkFmSQT
         VUS0uuQ6zooGDxv/OEQstvnNS6mah2rjkldYh8BLad3WOTsUx/xRu94jklkYMNhPFasl
         wTsA==
X-Forwarded-Encrypted: i=1; AFNElJ8TLjdIilBbWH7+JgU9YTabCkAw9YzK//cqzY3P09LngOQ33SJUqLwBKjw0vXGyNNUeAz34xr8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjsLxUeoiHRTnOIzyGcUaU44C/roe+EBlX+JoNBNdRnAa12zkL
	W2+00XZgQw8G4UCetZpPvB4YyxuY+p8UtQzOLh9kmWxr+/CLK4r9fEsF
X-Gm-Gg: AeBDievkbUuSgQ1sCy5srd+rudUZKnpXDTekQqd4IPpNKPzhubBT7dUiH2gH0nnHNU+
	qRQM6CMR+n1e2Xu2J3rceiF7ZcGgmY+wmt2mMy9XPAmX7YDnZo0fPMQruBz6lUQWuXinV3/PvU+
	5Em0Zuk8B92aEoRQrvG0/9c4v4p+hesJC9V+JVfRm2Ftbh59ecuwsNdlnSfeftu92KPylsgbUNw
	lTM5c9BzVwCSK+/dWcV9Ph9HY2VfjNuccwQAtwC5ZN84tB+6UaPH1AcHO0FYH+MELCP1y/A5u7g
	Eua7C2aCnj2TQzO58s4pnBCNCWrH6DXAXhfR1oIbm+r1OXoZrEIpweDyBisD1s1LBQCfW/tR1GA
	yohU2Z4WGObPbple9n5a9z3wTs4/WwlBbnfLQ2R82RCJ1XD2UFT3hOMqCVX9XSrW4Z03Yc6O8Ta
	qvJFfgqyXe9ZJiN0pSfDfw+VkfX4exNR/g1cXiXqNO/D4/38k6/I1KQgNsUQY0/dsjPtqKuQEk6
	tHehO8k8ICnrEpUdxJISMkX7g4=
X-Received: by 2002:a05:600c:1391:b0:486:fe23:1707 with SMTP id 5b1f17b1804b1-488d687116amr185252315e9.20.1776072737113;
        Mon, 13 Apr 2026 02:32:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm374255055e9.3.2026.04.13.02.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:32:16 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:32:15 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <77vowy4ax4cl6dlc45i2q3fjmwn3q676wqghq267tmbix7773b@27h5t66mflur>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
 <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
 <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
 <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
 <ff11954f-345f-4865-a86e-759aa167768d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff11954f-345f-4865-a86e-759aa167768d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_023219_583248_F51EF6A6 
X-CRM114-Status: GOOD (  34.04  )
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

On Wed, Apr 08, 2026 at 02:06:00PM +0800, Baochen Qiang wrote:
> 
> 
> On 11/25/2025 5:57 PM, Ernest Van Hoecke wrote:
> > On Tue, Nov 18, 2025 at 12:23:20PM +0530, Manivannan Sadhasivam wrote:
> >>
> >> ath12k doesn't seem to require a calibration variant. But even if the user
> >> replaces ath11k chipset with ath10k one, the calibration variant should be the
> >> same as it is platform specific except for WSI.
> >>
> >> - Mani
> >>
> >> -- 
> >> மணிவண்ணன் சதாசிவம்
> >>
> > 
> > Hi all,
> > 
> > Jumping in on this thread to ask about how we should handle variants.
> > 
> > We are using the WCN7850 device with the ath12k driver and received three
> > board files for this from Silex, signed by Qualcomm. All three support the
> > same board (SX-PCEBE), where one is the board file to be used for the
> > US/EU/JP and the other two are one for higher emissions in the UK/CA and
> > one for lower emissions in the UK/CA.
> > 
> > Since these are needed for regulatory differences but support the same
> > board, we were wondering about your views on how to handle that in
> > mainline. I see that there is no support for the board file selection in
> > the device tree for ath12k, and that there is some discussion on how to
> > handle variants in general. We are using a device tree-based setup and no
> > ACPI.
> 
> does your machine has different 'model' property for different BDFs ?
> does the existing ath11k 'calibration' property based mechanism satisfy your requirement?
> 

We have a SoM with always the same WiFi SoC on board. These SoMs are
then mated with a carrier board, in our case often a development board,
and together they form a whole machine for which we have a specific
device tree with a specific model and compatible name.

Customers that create their own carrier board would have their own
device tree with their own model string. These carrier board device
trees include the base SoM dtsi.

When these devices are sold in multiple markets, the model string is
thus not specific to it. For example, the same model string can be sold
in Japan and in Canada, with different regulatory requirements and thus
a different board file that needs to be used.

In short: no, the machine does not have a different model property for
different BDFs.

Similarly, the WCN7850 would also not have a different PCI ID in
different regions since the hardware sold is the same.

The existing ath11k calibration property did provide a way to specify in
the DT which BDF should be used, so in that way it can provide a
solution yes. Of course, with the drawback that the PCI device has to be
specified in the DT.

This would allow customers to ship their device with a different DT
based on the the target market and its regulatory requirements. Another
mechanism that allows them to specify which variant to use in SW/HW
in- or outside the device tree would also work.

Thanks for looking at this and kind regards,
Ernest

