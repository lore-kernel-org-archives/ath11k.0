Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14779606A31E
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q400rfsL;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvFTPjd+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iq+30juH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=; b=q400rfsL4QgjDZuCJwIevgD/XZ
	BLTv2EwzXJ6VB6+JalY5BiXr8l58ptMIsKqq/FcTPbOoClBGHDm2TGo66FLLfxwpwlWtPa7YDtSNP
	zPYueptZmIEbqKpMEPVWF/0x2hS37712lh9OxNGuL2lrz+WVNQkrOd8W9qD++UwCnt3gbIiV+w9l0
	OpS+b9n172j2VB355cKb2NZMG5O+hhLhIOx9DM5UXKPasBNwarwyt436lbSngn11+ARxp18mxou1S
	HhTxXnkl2RX/YaR2GoPi0I3jDAYo6FV0buDWHsA9fv7aLDJZBx9TQiiWKdNoWgBuduDu81URlMCDf
	tm424MoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVgH-0000000BpDV-06tc;
	Wed, 21 Oct 2026 12:44:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVgF-0000000BpCs-0k22
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 12:44:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfub7543790
	for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 12:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=; b=HvFTPjd+5tzhkrlG
	7tXsJCR2/O3mAWZ7h2hp6jn+zv0W6eCR3Vu16YG5UzuVCo/JRDpLLRIKQh0YaEMf
	XnsRkcglg9E3595WkeW3fm4sqG58CHHn3Ocq86Th+SalS0XWHTov8xxxYqDupQBO
	Z37QIg840FeaH1GbhlKM67zscIkfuc+8q0gOxCha91031OHGXcpcdCD1su6oiPn2
	80Bi7guepb7MDwMxrqU78fLUhDsbqn6w3kXrYF2OhFApvfmPtKSiV2KFIiCobVWo
	RwOxobMGx1bXOHN7v3TuB3USZGqgKfUCF3oMRNgD8hTbcbggp2zGoeTVlc4FEMTR
	BzV7TQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48qnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 12:44:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so19926885a.1
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792586670; x=1793191470; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
        b=Iq+30juH+dJQAJb0CDe1r/CP+r0kYacmoPj5lEmMeDRG28/yZX1Tz9NDSo2bbWR8Ff
         eAlC3mz538oY6fO3qp2cdJIx4G/+Z/kaQC5kf6+PosXpFqMZaCB/fJWVr0N/tDVmFjVt
         yJhizJFqgZmVTT2c1qD1pgQCcvQqR11ZiZYk57Jjw5ETW1MaGqC1m6qrRu4JFHmE2c8G
         JxTT5MVY4HLnXlRpWz00pZggQUzfwHHE0BLSnlmHDKBGlzfeWlqu1AkiaTYNQMqdkDVK
         7Oi0HI1yxURlMoOvAfpdP35mG/UWHWKkSCTJfxiwrN4M9VZnv9hR670H4SMgBFfj5zRE
         UFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586670; x=1793191470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
        b=eDZvT6T+F4GrpuOjhsxJkf3pIxJgUiC0XtLZ0yi8Yf/isdAMYep1dUL9AjlEqxkbeM
         9XI+UHD9p4s9K275Mm0MX69nXmeCW5OnnL9B0MGnstKl8BF2Z5Kh9hnm24U5+sH5U+dk
         F0q+X6WGDB5v4rNLKXOulwbiwkKSFq0t/fWJs8yhOnsuO/ieiad+A+ZWlmiXzp8wkVhz
         8KOjIumbo9eGVJP/cC80tA6TfLbgGzxEpfJiT8VyZIq00vU6MQfyZuJEG6cb8PkqzFG4
         7aub0HQUxUTbh2Xay3xJPdMUrrzLQ6QoefzxJ5n1TqyQZYsPTxSeNY0sE3XWK0h+951S
         azpg==
X-Gm-Message-State: AFq9FYJLs7ODS2CuFm5R4dORn84sxbQ0JktZgmhq5EY+B+p0E96L00Vn
	dQyiYRkDfEMCuxs5+1C6OwStcNhsNg9urS7wlzXwMxP2+YU7SWbkcYForNHrd+bAcODfOmAXGyC
	MkUUfElq/wskenhsx52jdIXmCQq0J6f5UYCYuM9USUF/hRrHPX3mLyLT+BR7lLq4e
X-Gm-Gg: AYBFou3vOX2g5c0b36v+3HGviYCnchq8EQwAKiqnZNDLpF7avxoYVUc3dyGUrW6G0Fl
	wouHEUS+db1x18RVxqBBOr8WPD0kFmmiHz7Dq37qrt7bTqpMHQR78FtOVAKwZIEwnSXud7kDcVY
	QhgxnPAkbqPF7WskTruLtWRzyfWftz5Sacleuddfwqu/ndUFMQeWVQ16cw8SRh9e6UhaOY320Ue
	H5Yb0UpYOA7fA6rkMzRr1EbLW0oAwmfeHm6ElMJznrAlpjvSXgKjeJvnoQJOFZUDDAsNkVnKwOb
	BUs6nPPUxZ1z11DHUOAy2974BQl921Vf7vzMRzmZqSObg3uPDhnXX16UPvAVOj2nGCPgs1KB/Kr
	YX8aR6YLQmQeXp4700XJc2Q==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr466830185a.2.1792586669541;
        Wed, 21 Oct 2026 05:44:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr466824785a.2.1792586668992;
        Wed, 21 Oct 2026 05:44:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78660sm72328066b.17.2026.10.21.05.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:44:27 -0700 (PDT)
Message-ID: <bd062ae7-74c2-486e-9413-15ca8c943055@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:44:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6
 Enterprise
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1791110510.git.me@andrei-z.com>
 <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bjWzcKb7srtssnok8E5EO8ebgf4sLX0W
X-Proofpoint-GUID: bjWzcKb7srtssnok8E5EO8ebgf4sLX0W
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8b3ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TO4f5atleJ8-af2fB8MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX4jpwmSdt+lep
 maBr2RP+vIypOfM6sNyNmWmkr3kSEitZzFRBGC0Cpg2aoFN+CLI3pIgaMG+Ey8YSGtWfAXDyK4U
 QyCbgisrl4tl90wvMYge14eftdaXvYzeS36+pqzysk4vj6CptvSWkmxkJO1Ql6RD1MNC6B18GVp
 dH9hbGrxoH3GjSS1EgSZMuXb6Pnu1m49SCzVmW67Ykmv6f8o3Qd5gwaG5i38T5vjJ72yJHf2WeL
 vvoTV03jLTAxLNu7GMovYqgeDWGXV2JzNsLHOyNA4ClBcvmy7KvEzWhgtL9xO8LSaVFWKBwXUT9
 t2WhWnmB/F8RIfLBet1R9Nt7Yu+Br2cvLL+A78OCMQzOLjx1QMslKROzDnXFb6d0scuh0E8s2OE
 AfgYmpLe1wm4ugwvrWgJVzoDQfHO9yiEPoATKivSzdz72MpqfX5+4n1xaVmvZRKvTogr3/O30UJ
 kXqJwNW+4jtPlcYaObw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX7XX7YCF9OK4q
 tEt3ZQExBGSzKt3DQwlIPqigyZxkWimOfTGDoxThU5Lu/nNx3iznwIR5iUB5rts1HbNBzkLLbUt
 qkpII0WVmfqFimWKJPcXbXdf3XgL61o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_054431_221158_E5D831C3 
X-CRM114-Status: GOOD (  10.09  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/4/26 1:10 PM, Andrei-Alexandru Bleortu wrote:
> The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:

[...]

> +	keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&button_pins>;
> +		pinctrl-names = "default";
> +
> +		button-reset {
> +			label = "reset";

Normally we do sentence case here, i.e. "Reset"

> +			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_RESTART>;
> +		};
> +	};
> +};
> +
> +&blsp1_i2c3 {
> +	pinctrl-0 = <&i2c_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please keep a \n before 'status', file-wide for consistency

[...]

> +&pcie0_port0 {
> +	reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;

No wake-gpios?


> +
> +	wifi@0,0 {
> +		compatible = "pci17cb,1104";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		qcom,calibration-variant = "Ubiquiti-U6-Enterprise-5G";

Does the same calibration work for both radios?

[...]

> +&prng {
> +	status = "okay";
> +};

Please add a preceding patch to enable it in the SoC DTSI, this should
never really need to be disabled

Konrad

