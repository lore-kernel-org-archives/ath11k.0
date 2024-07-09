Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92E7C3DA42
	for <ath11k@archiver.kernel.org>; Tue,  9 Jul 2024 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UW/tk2VS0rBFMXEE1Rkw49ArZ9R5xZe0N9RehvVirc=; b=PGxt/o/px/UCgYBd+IDjYMDWf0
	/0YNpDugc347WxbI6OtKENWYdAOMA+tvygR85UvDmFgZq0vg/47KSKqMh+1onlMHEaxSSSim78ipK
	FkNVKjZpiDdh6z9hLbibbY634x3W1S6L9F9+4F4VSkkuXIakzcs6JhtOfGUd9/4fZVdJDbkfF7BsV
	PvfcMbwni2Y+VKXw5S/L5JOpaNgkOCurSYvMAD7B5KobKk5VIqCYdrGAg69e/43gJxpe2aPK2O6QL
	WvWey28TEXdvo/mUMt3Yq3DaNvI44c4jXs4xGo8g31NAPoyCK6bkRClWv6tdb8c6rZ39C+5c8qSKN
	WD4HaQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR69C-00000006OSj-20Bh;
	Tue, 09 Jul 2024 08:24:26 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR694-00000006ONX-14pz
	for ath11k@lists.infradead.org;
	Tue, 09 Jul 2024 08:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=azg-tech.com;
	s=s1-ionos; t=1720513455; x=1721118255;
	i=stefan.zegenhagen@azg-tech.com;
	bh=4UW/tk2VS0rBFMXEE1Rkw49ArZ9R5xZe0N9RehvVirc=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mDqvch7qI8JxOM/aMWYc69R+7fB9MutygjHxrChtbuaKs40X1hqZSkC+bMQ4SCLg
	 /jQ6H2YmEErfWyVRfu4HGUF5S6TaOhzKqJhBrTatNdgKpmjPd5CxO7uuTHw5q4Vd/
	 Nagk1LIJp6TnAOE4v4TDclLltIjw8aJ2X52cumOtAEwfj6S94/el5UWknbSuUR6Qh
	 Fxe6/ImUSvrIkuY/oJzFfjAdpqKS7CJw+A3WfQTxivSVkmWT0zPrdXnMVqjGObG1i
	 AgcYJX2vtci6z4e+zpsgbI2s04PcUaUGKsH8y5uE87E7lraKlksCLhkThEsFkfmvc
	 eqygUDWN7kHnHsKRBQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.10.4.93] ([217.91.114.181]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mbiak-1rp1V31cjO-00iHQo; Tue, 09 Jul 2024 10:24:15 +0200
Message-ID: <196d7fb9f411cbfad0c8cf690efcf55da01469c0.camel@azg-tech.com>
Subject: Re: ath11k: IPQ6018: support for 802.11s MESH
From: Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Date: Tue, 09 Jul 2024 10:24:15 +0200
In-Reply-To: <87frsjdhzn.fsf@kernel.org>
References: <3581dfd05dd3468d97b3fd06072d206732da9482.camel@azg-tech.com>
	 <87frsjdhzn.fsf@kernel.org>
Organization: AZG-Tech GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Provags-ID: V03:K1:5Dg4DWKBnSxo/3hoUCpcybargRIZGIvq8O3SmHJXs9DXnxLzLZP
 TmpN0Uc5DdGuIrYR4hrQBw0AIYQDmOuuGTH4wDOhjRshMZg8A4whe1FbnH1JZ2aQUuCCBGI
 N8CBWRE6ipn+yHnWG5lP/62zN5xZC+X5R7n15mIQMyaMLLA2GtB2lcM81HOzT0VF8mjLKx8
 CIBbI8f25fUkvQwpzjKGg==
UI-OutboundReport: notjunk:1;M01:P0:HHMI3lIwK/Y=;k4FnSxjaFkouNTUR1W95gpJQyiu
 O/OiC2FUPp6GAYPLUd1yecryXi6rAptuqkQA7WqnpcUHEaqkNrjYh0aydvUILFVjTYkwrm1Na
 KQrfoFc/KcC+8gU9ZCtDOh6WWhn3SOE2z6ES8eCzWQvDBzDMVtGPl+pOQI25dbjVO3JRcYK1G
 pHH8JVMmx8GpD/HDXrhvkVmHN0Kc/QnC4q3Sa8bFN0uiwjmu9ctkFfVz8fKR9XEj67MVkzMoR
 VZNnXsNoMUG9S0qmvEP4LamMEOAUt3dVFPG8ZMjSld36GbJi5iboSR2nh+Ch/LzmioTh6Aaf+
 TMuFPZEBKdEgR4DcEO9DQ9JehNANYF1w+CgCA6teSjUW6t6Bo9nw1Kby24r2oV4p54BD9omco
 bqg4s1B5M//jMY+s7h58qNdEa+4OrzRuTcjjm5jK2Ze17w+1Ygof37/CEN7sbN0hBoA7UViim
 QiS3FubZjgodnI8BL7fs/9ATMkgYsgah2KOg1GJsuyrFVdypdbvK5ttTcWE1449E5Wfd1o0GO
 NzjqKaxOtqcV05bppRULSi4b/FXPF8AVl+6GhNPqFPZnsU2OC1jxBfeVVVlr6h33/JNthT9p/
 6IEck9qGGasyNu5z35vZuCzIKph8+aSJCd5s56po+ZGsOKVt3LDwbXBAo8zSgNQ2cKrd0a33w
 zZ9YwT5QTCfFpfgP4HaA9Vp5oZDKURmjdVoxtB414hYyu5YPU9kGNHydkx4RZgytcvZkZ4q7y
 UScjLXnviOHtZQY2TwzAhYiegPOXCE6okIHCRB2UCCKBenvRSwWUKs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_012418_906467_5A3CFA65 
X-CRM114-Status: GOOD (  21.46  )
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

Dear Kalle, dear all,

I can understand your concern regarding unknown patches. I've checked
carefully that there's no OpenWRT patch on the ath11k driver that could
possibly cause this behaviour. Most patches are vanilla kernel
backports, others do harmless things like
 - disabling coldboot calibration on IPQ6018
 - setting FW memory mode via DTB
 - tweaking QRTR instance IDs to allow multiple ath11k cards to be used

However, vanilla kernel still requires numerous patches to actually
work on the Mango board. So it's difficult to test without any patches,
since the IPQ6018 is a built-in AHB core and I cannot simply plug it
somewhere else.

Could you please at least answer the question whether mesh is supposed
to be working on IPQ6018 with vanilla kernel, which firmware version is
required and whether it is required to enable raw mode data path? Is
there some knowledge around? With ath10k, there was at least a WMI
services file in debugfs and a feature list in the 'bin' file. Both are
no longer available and I can no longer see anything about firmware
capabilities.


Kind regards,
Stefan


Am Montag, dem 08.07.2024 um 18:24 +0300 schrieb Kalle Valo:
> Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com> writes:
>=20
> > Dear all,
> >=20
> > I've got an 8devices Mango board here with an IPQ6018 WiFi6 built-
> > in
> > via AHB and running kernel 6.6.35 with OpenWRT patches and firmware
> > WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3.
> >=20
> > Somehow I can't get mesh support running as it should. Tried
> > loading
> > ath11k with frame_mode=3D1 which leads to association via MGMT frames
> > working fine but afterwards no more frames are received and
> > associated
> > peers time out.
> >=20
> > When loading ath11k with frame_mode=3D0 (raw), association works well
> > and
> > afterwards I'm able to transmit frames with sufficient rates, but
> > RX
> > hardly works and spews loads of kernel messages.
> >=20
> > Is mesh supposed to be working at all with ath11k cards? (See below
> > for
> > more info.)
>=20
> We can't give distro support, we only support kernel.org. If you are
> using OpenWrt patches you should ask them, we don't know what changes
> there are.
>=20

