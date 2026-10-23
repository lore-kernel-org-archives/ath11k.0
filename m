Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C050B606A31A
	for <ath11k@archiver.kernel.org>; Fri, 23 Oct 2026 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LuyxOQcV;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg6h2ZMC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC8dSbhx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=; b=LuyxOQcVzyM2fk
	ZTHTUx6X6O8MbPxyQsqmps4BwLlRDQpBooE8DMyrJWb3Vf1SNrOXBq+0XZiG2aHNGpkYnVqDnN5fl
	+1A2+l9S+7Thy3B1zDUa3Nk6EzgeaGcPJ5PBs8pSVUM+T+2+/p3VzfW8Ax5PCsIgYFAYsNNXgWe1v
	lZ/tWL3FTT3r2Z5nO6kRJi1oNxP8WdJQTUOmXq9HiDt5/TJ6llOfvpBqTebY7xPNSYbrrhpfqaPd8
	W/A3ZbzXu1jXL+Sc9ZaOg45mU4kr5sl35RJvAbcqbCP1pZ7B+gq7E1QsegyOtt10ucnMjilNjao/L
	pB/RwWDt1bpDWcn2kryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFqi-0000000GSnm-1l5v;
	Fri, 23 Oct 2026 14:02:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFqc-0000000GSm2-1XMY
	for ath11k@lists.infradead.org;
	Fri, 23 Oct 2026 14:02:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAbjm980702
	for <ath11k@lists.infradead.org>; Fri, 23 Oct 2026 14:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=; b=Dg6h2ZMCLLsc/yP1
	I6qTTMVxn0gHmzaeTvaOGgud5bFVkeJocoTVCav4vqqdigQvcPIuygrlLDH2EIxe
	F+TGw6CKOac8cyTs6zr1XNCYrnoA+aNBnWo5jbsqL2U4MJIguL8QtS4PdAyxXJL3
	tzi/lByzoafs5QJ2whEB/A1L9sd1k+sxRfoQ46vJhdhtOcmQZqEOIjV51vgvE0ej
	EgJYrK8vcdyW/OaHkwSfAIfACEegabPswmbrzPsbvCXm1wt/e9CZkODgh2aTStbs
	z2pJclQcrIb2EWusOmtMfJgP+oYsJGA7HFyXYlCJkpMma8IznROzhB44kzgRqP50
	N9XDVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmauehp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 23 Oct 2026 14:02:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso159970eec.0
        for <ath11k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764137; x=1793368937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
        b=VC8dSbhx4VYcWAZ1d1+N+CFXhGwNPyBD4AYquqQJklJGAsB8sLyoWc3i+UyDgf6UYO
         +8Th1CH0dvRKbgm78pC+NQI0dN7DAMqkQLbLtae9uoydPsL/b3/LdjMud/McbvRvFHq8
         MLGei5uRPSMUgtkHSDpOyfPNpYTiFSsg3xLuCLNn9q7wANF/wHAtm6a6twTCIqaf5khb
         DpmscdtAPARNOmKlVzMKxDpj2CXqE1hFePLDqbnmYnEkFakrgbH9rDlQ27q32+vRAu+/
         4k3nsY6xsbkj3AC4gBZRwCG6uQ581244chUcchIDjzxsdadPl3a1aDMQfvq9gjtpWn40
         YXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764137; x=1793368937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
        b=BVI40S7zfYPs6AHFFP+hBuzhWpKEk9dbYZtzYscr9KRE5vxeST0imN/5O2j7saC7ll
         8VjkQGZ20SsZWCSmAgJ7066KrpObt0wXtW/SrVLPeTa8dyod0A8Wrj5cxsMse576+jYI
         CMHulIpDPDLGL+aWLNlwvTht1Q924aP+ljLZJlJ18BgvLuXj9qtiCDmaM4UgAaM2srQn
         4/AQB2+nR9KI32gttLegMfd9nhjA8O2oVoeVB2bcviVkk+bCn7hz7Z6ZUGkClmmIewwU
         DQHkeXIv+PP9L1a5SxqbRgC3Xx7GQrlqxiUlqiGsPbupo9lekEWy5oz7O8wHZJHiPNxB
         cWsQ==
X-Gm-Message-State: AFq9FYJGAUdW9wMZB+x0z6/Lv6Cpp3SQIWWjgbYXsLa+w3j05imOnAbX
	JwEjlG2H1253rjGKo+68F0shuGW7HfMfY8BKEueYc2vgOgpbWdisPzOi/O+y6m4CDMFY8iFxi5R
	C9k6kTHsSsra+0C9L8Hxvzrbojg62IIS8K/HdebEACKf0sebmdqGWw9620jKJwxXq
X-Gm-Gg: AYBFou0YoJ+CPJi4ZqYJ0qL4uRaB81NYG6wVDqXWgMy3yL6JLrVnlGIIA16Zj9eycv1
	4m4v8SMtdnE2yM8ViIm3phlnzKo1kB61QvPPawew7QSrgJt47BLVJlHEUwzzjScy1DjQ1I7FUwO
	2IL4A6FwT+8VrKHW4lPe7qc/XGWlFQtG073d2DQSOcNFSVMSFoA2AYzbkyhuQEXRm25LoRy/x9v
	adwA0+pJdruABXyLo0p1qlKmjYv58gc53tvKCY/6IGaMdO9I8DfBPfpc5AsUTewaz9+vKZ1dW6f
	rZQTDNHPVPVcmIkfB1q/ozGr4siT/n0ARy/Jv2j1mvpI22aoHUJ9SyNRgpm+z6TkhAfNULWaPcq
	Tmp1qx7Lt5eLgaCBKRRiNig==
X-Received: by 2002:a05:7300:e9c7:20b0:369:d85a:d416 with SMTP id 5a478bee46e88-369d975dedcmr5567431eec.1.1792764136776;
        Fri, 23 Oct 2026 07:02:16 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c7:20b0:369:d85a:d416 with SMTP id 5a478bee46e88-369d975dedcmr5567356eec.1.1792764135935;
        Fri, 23 Oct 2026 07:02:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8d3a041sm3976866b.68.2026.10.23.07.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:02:14 -0700 (PDT)
Message-ID: <d237678c-9279-4bd2-9d72-b98830db5d79@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:02:12 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6
 Enterprise
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1792761470.git.me@andrei-z.com>
 <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb68e9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=5oLZaV2ftHNI1lavKEwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXzUBcoIoeq/9w
 Uc51tDACUHWmcjZQHOhebaoufob+EStfU9W6kVTtpWKtzV9lsYFbpFsDJXOHUD2qseS8ABN0fno
 m1gplYaZA+mrHwYadHnnOVV1ioL/0k0=
X-Proofpoint-GUID: GkE1R0iZu0LqwP4vlg4WhtxC7CubZ61W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX4RjIsra9PiNc
 jr7tYSOjruJyfTdenSumJZl7b1rJjxhMxcWR+0NwSvy37laKnN2JfU63BiQFRQ9VrtKBzWsT6Qc
 Niw6viIOR7X4ahz8P9zGyHj/Ji2L+tKC1auBVlfzTrLMhAVebtoDxthsPPuj3yWvnt2B5nPz4Ee
 MPhrmobS+G+Fda17OcXspiOCdQq7SzOFOiNqF4uJBSuKQNRFHzFr5mgBqLWsYpGi0pq7amMHXFO
 R45bJdCbygrugqNa9qnGgKLjQfdOWgUoiSWcdRwEmyK0GZzvx4LqVhXZjjl/R8Rvu76kvQ1lZrn
 K/VFRlweOiwJZSBeM6Fv3a8lfe6BY65LIArxNZpXua/cz0DfPXEgTrFBxjU4Xu7BMjTzHaibJXN
 EHhAP02oZTfp+KzEywmdyLMHf9E6UVaQKUHQ3oK7unB4PCg4kSW/QH+WGBfuRk8VtGk3DpkNYTT
 Ui+K4SDt4qwtpr7eZvg==
X-Proofpoint-ORIG-GUID: GkE1R0iZu0LqwP4vlg4WhtxC7CubZ61W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_070218_437888_6175E4C5 
X-CRM114-Status: GOOD (  11.19  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/26 3:37 PM, Andrei-Alexandru Bleortu wrote:
> The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:
> 
> - SoC: Qualcomm IPQ5018
> - RAM: 1 GiB
> - Flash: SPI NOR (boot chain) and eMMC
> - 5 GHz: QCN9074 on PCIe0
> - 6 GHz: QCN9074 on PCIe1
> - Ethernet: one 2.5GbE PoE port, a QCA8081 PHY behind GMAC1
> - Accelerometer: ST LIS2DH12
> - Button: reset
> 
> Describe what mainline supports today. The Ethernet port and the
> IPQ5018's own 2.4 GHz radio are left out until the GMAC and the WCSS
> remoteproc have bindings; the LED controller and the board MCU on the
> I2C bus have none. The QCN9074s carry the calibration variants their
> board data is looked up by. The SoC dtsi gains the pcie1_port0 label, as
> pcie0 has, for the 6 GHz radio below that root port. The vendor QSEE
> reserves 4 MiB, twice the SoC default.
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

