Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB93A606A31A
	for <ath11k@archiver.kernel.org>; Fri, 23 Oct 2026 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5zXWKXK;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nvKYPh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsaXNFoE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=; b=P5zXWKXK6iUzVy
	M+2CdoChHMMspIauZ43vjRbrSKtU8MbgmoOEgWMrhYyPM3YZPKuttlVwKWmChcw3bZG5/rSu/c79O
	tZV8BTuWwKc8dBM/s+Cl0ihmGXjboMWZElAVhup+iqZu397RZOMGSJqvxUH18rDGqUKK+BKfX3VT/
	AuNGvYqKYRlVVcIog4b+/AlCPxY44KIyiqU7tiIHAD8YiYlBLH+qAP9GPLKLri02l4Nh/A8i8DyjW
	ilzV02aldMEo4STpKYy1UyBNT3eSQABO/eqxhIFoxYlMUr7Oj4rpHn35QssUVk4bgfdnYF5quu182
	JKILoWB24gfDN5bBdRRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFqR-0000000GShv-0ttZ;
	Fri, 23 Oct 2026 14:02:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFqL-0000000GSgA-2ptc
	for ath11k@lists.infradead.org;
	Fri, 23 Oct 2026 14:02:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZx73045393
	for <ath11k@lists.infradead.org>; Fri, 23 Oct 2026 14:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=; b=V6nvKYPhgn3BRCsH
	D+C4GKviWCHFhHRvrWqZbfTSyoaccLWj0wcjxpS6eOQ12bl7O0A5goNu3khwVj+U
	lYgBlX2I2XYnRSiUAtxrh7qB35vyAKAtWAiX0BZHJMzb7fe1kCZWzzPLRJt+XQhN
	4v8CZjjjHh1R3AsC1hhI+YzGrYDtZFuUToIRyZqSpiL/6xonmm1c7K828ozce/Nc
	w1fTshVF/33gH1E9kjj6AIymOINqWv/9syM/Ss0Wy3kkH3KxYtdj0w0AKLQ0MR1N
	sHj1IVLK4RbYwa/IJrl7YkqZdaWLci4hNqJ6S35glWV2op8uiaFoI5pdVa7sq0SW
	yqEMDQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjc11b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 23 Oct 2026 14:02:00 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-49e39a34b44so45119fac.2
        for <ath11k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764120; x=1793368920; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
        b=VsaXNFoEiFlfGjJN64ADZpyq3MRKvx0cU3IdRT3aF4Sp7iOZD2HBQjvFnq7jyBoPr7
         SDg+9gtPSZBreJqdQOhzlVxWcSn7AJ5gQSWUvw5/RQcfaVn23yFSpfBulEBhAQ2K2CGR
         B9O4vC/ayE3SMFcroVVFANFt11cRFniaqiOLiSSOQqPLB7Za7n3ecrj46wNLc8YgMmx+
         V8FrFS1LBe+p91lreu9Z4Yh6no7XEOVDPFDLC4/W1destolGDE0rfbBNI6ZF0jHqhOtc
         Qg4bHuSTI5gh6tcxPKzVFG+K0sssJTVoYzGiMXbA56LWjiEODjJjYseTiiIYjrVpxyLe
         lHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764120; x=1793368920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epYwqKMMUenq+YYIVdJN8Y6zhWFe4Mlrmgte2eBFW8I=;
        b=g7J0yPYHNovZekSX898AflUEudoZ+KQ9fEsA+JveqUFg5WoUYr0uHegdxxTVZQekm+
         8pxwBT7MCjyfRekBMqLDjd+xoL8mOKlC5QojFxM0AEqb9GiEKdrCA3/5vcqCXYvhJvWd
         g0dT87/vxzi06Uu7cY0XLmouV5FUMxvGXJi3GKboJFxFmfL46j31/PCf2t1ZmhggunWb
         DB+nEueVzgIzQ5kavbyw8+ZnQIvzYpDlFDFwJXI+Rv/qrUkTrG3p7xLdUgkUTWGOHWSN
         mCeYsuih26cGIxW2Y9ObGTMBXEhYkjawahqeiGOB8Xi+biRcwOUWs1RYPlW2CNtaZ+m5
         K+5A==
X-Gm-Message-State: AFq9FYLM6sQ8sKObnEn8CY3jWcugb6mM4foNZxhHw+SbfxAfZlDEiQGw
	Pmg/f2GySrti1+/Sfbl7znx1KYWZYOAPmRNPh+zasgJgg4Ao6RqiwF9Pwir8aSs1AKGAhiVkkzB
	5JVdCqPsTx+IH962Oyo0lOp2sef6s47wXtNHRkLTENrBG+Lm35Ri9RwwYTd+69vHd
X-Gm-Gg: AYBFou1cYDNavNHZ55rRXK2xQjAPjjC7hDMy5g8OWFb22QpD36iLevP5PgsHMnlOmiN
	iWsdp33AvMswJvipbZWzdMNSb0remsS1BckOgpez6x2j8yIkEK67l+Uncz0c/Jc5Z4znPSiGIIH
	LAZwmL2ZdGwOLXjbVYyqHRLZKngybuZpFWW1wvU/TXBF0r3zx5pUgB/Q7di9KO/IDRS3D0269Uj
	CjOjm7pEceuxYrUasie/XLOSKaYuqDYt6m3Udoj0tfDBS8yGA9ZHEj6gpkmchnsMnM7oEUuMZ+6
	eXtCh+2ak/xhRnK00ovKYTqtW6QnDMBaGxHAY7BZrPhKHxyz45QDaw9EvlEYxuYNeoycIzYqBuv
	dBBtjk6boWTSfo0UZmY0APQ==
X-Received: by 2002:a05:6808:1386:b0:4e8:b729:3ebe with SMTP id 5614622812f47-55bf88f8b08mr793484b6e.4.1792764119576;
        Fri, 23 Oct 2026 07:01:59 -0700 (PDT)
X-Received: by 2002:a05:6808:1386:b0:4e8:b729:3ebe with SMTP id 5614622812f47-55bf88f8b08mr793350b6e.4.1792764118501;
        Fri, 23 Oct 2026 07:01:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8da9019sm3783766b.78.2026.10.23.07.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:01:57 -0700 (PDT)
Message-ID: <071fef59-9131-42b8-941f-d7fbf5f57ba1@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:01:54 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: ipq5018: enable the PRNG by
 default
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
 <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Qe5typ2oBqMiQwuoMzO0B07Ba86ZkCg
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb68d8 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=pjGKqCRHFsEXOSBd6YcA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX35/KEQCgBcw1
 n3Soy+HStb8r4JJkxZiFM9aGei0sGx+F+fm6QCk85cJDDQvabsoIELS5BIAnAesehFT9YBX0rjt
 naRwJeougK+569V6zuuTZH+qCm+Itf8=
X-Proofpoint-ORIG-GUID: 3Qe5typ2oBqMiQwuoMzO0B07Ba86ZkCg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX7s+MPYi+q2Sk
 Y+yo+mjRkKfsaeZBp1V+yBe7tfE9wbwQRVXgVeL54FbqJb3/WWlBDLg9bWqS8pj9FmY32OjPbD2
 O51OHxn+usUbiBaSiWGjXGeUJaArkgK9Akfd+/Qd+tCPnGRzwXhHmL5gdrUgH7lVdQ+1DWBZUBe
 4hNhkTn6R2E31FvVuE33eXunkmvXOrzJ3yH02OHX4r4i+mglRKxcs2MYZRzZHyxx2v597MA6/qZ
 CAHhQ0Tr6l+MRlafnKs8j0xvsLFuiwS87Up+eFSZZcYzAYy4FiutkHYKMJaVnbf6B6uolrkgNeE
 S1mt90iVFgrzCjt43eE/WdTvmrtBbJ3l9IPWpU92Eic3t06SCBjPvi76Jqm+WrTyhK5Ax/77hPh
 zaCyfYN1aGO2ymO0VpYnOH1vBGmUEIjRI/T/NgPKwTbmdelXNv4lwJiD4u6MpyunyIyd5rkevqo
 MTo+xX8jbd+L/sQELPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_070201_838181_D414CF6A 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

On 10/23/26 3:36 PM, Andrei-Alexandru Bleortu wrote:
> The PRNG needs nothing from the board: its only resource is a GCC clock,
> and no IPQ5018 board has a reason to switch it off. Enable it in the SoC
> dtsi, as ipq5332 and ipq9574 do, rather than in every board file.
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

