Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B32606A31B
	for <ath11k@archiver.kernel.org>; Fri, 23 Oct 2026 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KVJgvHfD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eMDy3nWD;
	dkim=pass (2048-bit key, unprotected) header.d=andrei-z.com header.i=@andrei-z.com header.a=rsa-sha256 header.s=sig1 header.b=aHpRPLaz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dvXvM6gi/E2yselhgxqrboFUToKsfbHMCdJebTKtZOw=; b=KVJgvHfD6Wq3kch6q1JBbJY9N9
	r8AY9IgFn8B7xGhHxH+PwCTKvUInzLjJXguknOI5CYc0gNuj3Ux/jkUcyTOAHUFClkKB+Ildsh3/E
	te+eOnZsg4znuxYPV3IEgfklI4dUrveS7CfHTYDN6LcXtiqABEyF/E+J3Azi98PrPqBWl3JJ5CgSh
	q7OtUTtycYo4vweqhiwt0hHX1g02qoVmDBVDGAXNAl6bKLL6zrvxcriF2MCQsJT9ZmViksehdY8lD
	YO5MsgdAQeSk3cNZhRmzKHhubNQrQSmumM8XWsmLQ4Lj6iYKngjs+M3rULgAgTP2pVjjDietkUbl6
	7FruxjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFKf-0000000GNoE-3kOz;
	Fri, 23 Oct 2026 13:29:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFKf-0000000GNnT-0CVc
	for ath11k@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dvXvM6gi/E2yselhgxqrboFUToKsfbHMCdJebTKtZOw=; b=eMDy3nWDsntFCXXFM/LbPIGYRX
	UvWhEdOKtywQ7zdLv6JXFOAg+Rwnn/Ta26DA6Wq0bJVVfsMZf4Tw38Tjp/S7wcxs6PJjiURq7Nrwj
	x4xgARlOcrI4VQQVDKApPpf50FOJdAmFv2dMmbPpsWsoDrxAmpRf94gQ68rKz1PoE2fO1hxRaEjWX
	6LyM+8ixOZ5v7VW/2azfk2ScCc5iEsL4Q8FC5GlhaJULHMx+HLuSIDf/0IqV4m8ncBXXmcHOo6vpS
	gqNqAb+9e52e04TQ8BglFujR5PG6QuxHJGCj3psM8oAYHB9ekIxWJ22Guby94GDS/aknN2b2V9lTr
	2v0BDcVQ==;
Received: from vtj.irix.systems ([82.76.27.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFKb-00000009hM0-0HcR
	for ath11k@lists.infradead.org;
	Fri, 23 Oct 2026 13:29:15 +0000
Received: from MAILGW-BIG.big.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 3A5B0FC16;
	Fri, 23 Oct 2026 16:29:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=dvXvM6gi/E2yselhgxqr
	boFUToKsfbHMCdJebTKtZOw=; b=aHpRPLazih0fcvF1MJFXQI75k9QpE+N0VE5f
	zhBPahCPoYfuThOdI94mskCWWNfwTbyI6ru6hr8CGjE4mKz7xT3htKUQxzt0ZfXA
	81T6ZPSl0D+2xYE0VoqxoZwserOWYolpVoqDlkDRa23mcp2U03Lmj+SzeVmuc578
	rTdgrMrVfmVADZ3Tr0//VpusH3ylYpuEh4OFqkLR7zyr2esQ0OQkpn6DQVamekXK
	OkXCl11KztY88Xd1qTM9lWBr/Z2KasfVRjGaYIZ04MAAJUiWDS3kafS6sAa1ePCG
	hEMI1HL0nax7vBe/BVLZaMslwlFdRVk7zExjzkOBJq/LHFPUhA==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 0976DFA52;
	Fri, 23 Oct 2026 16:29:00 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:28:59 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>, Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	<ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
Date: Fri, 23 Oct 2026 16:28:54 +0300
Message-ID: <20261023132854.3641937-1-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <bd062ae7-74c2-486e-9413-15ca8c943055@oss.qualcomm.com>
References: <cover.1791110510.git.me@andrei-z.com> <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com> <bd062ae7-74c2-486e-9413-15ca8c943055@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_142913_361845_BA128819 
X-CRM114-Status: GOOD (  15.24  )
X-Spam-Score: -0.2 (/)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 3:44 PM, Konrad Dybcio wrote:
> On 10/4/26 1:10 PM, Andrei-Alexandru Bleortu wrote:
>> +		button-reset {
>> +			label = "reset";
>
> Normally we do sentence case here, i.e. "Reset"

Will do in v3.

>> +&blsp1_i2c3 {
>> +	pinctrl-0 = <&i2c_pins>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
>
> Please keep a \n before 'status', file-wide for consistency

Will do, for &blsp1_i2c3, &blsp1_spi1 and &sdhc_1.

>> +&pcie0_port0 {
>> +	reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
>
> No wake-gpios?

Not that I can find. The vendor device tree gives only PERST# for the
two radios (GPIO15 and GPIO18) and configures nothing on GPIO16, 17 or
19, where a reference-design WAKE# would be. Without a schematic I
can't tell whether WAKE# is routed at all, so I'd rather leave it out
than copy the RDP's GPIO16. Both radios work without it.

>> +	wifi@0,0 {
>> +		compatible = "pci17cb,1104";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +		qcom,calibration-variant = "Ubiquiti-U6-Enterprise-5G";
>
> Does the same calibration work for both radios?

No, they need different board data: the 6 GHz radio below pcie1_port0
has "Ubiquiti-U6-Enterprise-6G". The two QCN9074s are otherwise
indistinguishable to ath11k: both are 17cb:1104 with subsystem
17cb:1104, and both report chip-id 0 and board-id 255 (unprogrammed
OTP). So the variant is the only part of the board name that differs:

  bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Ubiquiti-U6-Enterprise-5G
  bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Ubiquiti-U6-Enterprise-6G

The stock firmware also ships a separate board file per band. Both
board files went to the ath11k list under these names.

>> +&prng {
>> +	status = "okay";
>> +};
>
> Please add a preceding patch to enable it in the SoC DTSI, this should
> never really need to be disabled

Will do; v3 drops the status from the dtsi, as ipq5332 and ipq9574
have it, and the board no longer touches &prng.

Thanks for the review!
Andrei


