Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006B7ECE57A
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6NYj9i34XFFFsVywwCZazd72p+ROr7Wc2hDGbg7Y1I=; b=4L3KpLuWBwhl5CgzmmWPtflZJT
	auURhf5tP67hplSJaQ2Ax+qXZUGYwiwg/IBI95/4lC/k9eC0F2iXuM/JoDRRPkZpnou3qJffWvxfa
	QSNkNird8ju3gjHd2tibbGlhlG0rSQ+C7g2/d3tKXff9eKsh+Gby8UHaaib9AMTOTH/3jnQhfloyV
	DQel7md8gCa7HuRdIBdrPpAetdUvVj3E3BIMI7/hJ1Ckhcx0yCiLeQPxIGmcXtplhdm2+LDmLK6VO
	VXTxRtmBhgyDSBuWMq+U1VihjjR7ubxaDXi+5E4UIFndy8pjjsWcIOlXUvyTlOgbtcAz2lArUc+WO
	4qkM1a2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndns-00000001uZl-1m5O;
	Mon, 09 Sep 2024 12:47:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snccU-00000001gHG-1mxJ
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 11:31:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19015A43389;
	Mon,  9 Sep 2024 11:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B566C4CEC5;
	Mon,  9 Sep 2024 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725881505;
	bh=HvvAyacZkn5TCe7k5z6EOZtDMR/W7YSYa3SHtYybxLo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bJSU0K86tbXHFaOETav+onIb6a0vugOVYhnP9TM7CttSHk09o+CorYU+LcsSuV/aY
	 UDCK5svUr7dYXv+030BfKYZ2XQ4TginIqotHIseX2nsgzpGJe7g+9XbUQAo52sxhFB
	 +2DNKfgSWJQV259lHyOPmPIMmTC8k3odbhd0iApQuF8lvm+3A0bjMwdWvkrQhF9F2Y
	 oyBPHUkMaF9eM3FKqFTPcjWSJ9lpMJlQc8YZjWQMO0ddh4Tw4k0rSpmbHshajO4yLE
	 MR/dcYsZyW4rk6MoUv1LlGlmrzitOY1uhR7t8J5YPmNBb3vW7zrn4NANCGv9/t8LNU
	 d9Qv7Mx95seCA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,  ath11k@lists.infradead.org,
  Dmitry Baryshkov <dbaryshkov@gmail.com>,  linux-arm-msm@vger.kernel.org,
  linux-media@vger.kernel.org,  agross@kernel.org,  andersson@kernel.org,
  linux-kernel@vger.kernel.org,  konrad.dybcio@linaro.org,
  mchehab@kernel.org,  quic_vgarodia@quicinc.com,
  stanimir.k.varbanov@gmail.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
	<d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
	<87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>
	<6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
Date: Mon, 09 Sep 2024 14:31:40 +0300
In-Reply-To: <6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
	(Dmitry Baryshkov's message of "Fri, 6 Sep 2024 03:49:06 +0300")
Message-ID: <871q1tgj1f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_043146_612355_97A5970F 
X-CRM114-Status: GOOD (  25.64  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
>
>> 
>> 
>> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
>> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
>> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>> > > 
>> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> > > ---
>> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
>> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>> > >   2 files changed, 120 insertions(+), 1 deletion(-)
>> > > 
>> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
>> > >   &xo_board_clk {
>> > >   	clock-frequency = <38400000>;
>> > >   };
>> > > +
>> > > +&pcieport0 {
>> > > +	wifi@0 {
>> > > +		compatible = "pci17cb,1101";
>> > > +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> > > +
>> > > +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> > > +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> > > +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> > > +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> > > +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> > > +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> > > +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> > > +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> > > +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> > 
>> > Please add
>> > 
>> > qcom,ath11k-calibration-variant = "name";
>> 
>> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.
>
> NAK, nodes describe hardware, not drivers. And we have had enough issues
> with the WCN wifi having collisions on the board-id / chip-id / etc.
>
> Maybe we should make calibration-data required for the DT-based systems?
> Kalle, WDYT?

I don't know exactly what hardware you are referring so this is just a
quick and vague answer, take all this as grain of salt.

I don't have any numbers but I'm assuming most of the
ath10k/ath11k/ath12k devices have the calibration data stored in OTP
inside the chip. There are also devices which store the calibration
outside the chip, for example in DT, but my understanding is that they
are a minority.

If we were to require that the calibration data needs to be in DT, and
not use OTP at all, that would limit the on types of devices ath11k can
be used. And I don't even know how we could easily extract the
calibration data from OTP and it would be extra work for everyone.
Honestly I don't really see any benefits from this, only negatives.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

