Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB53DFEEF33
	for <ath11k@archiver.kernel.org>; Tue,  7 Apr 2026 13:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=; b=1mKHHUjdnpTiCs6qFVL6wtRPPn
	BTSvWK/OJ0Ckaad1OoAZwENkPMpPzEOk0NS6GNKbOK3sYVA/ugQMnb09XJGF2jt0NKqMbmIrgEw7l
	G2qrejNIjNY7f3SUZfJLkCfIiVatp5N+a9WiBqhoEk5g4nzxNmFETuj9V/rne9EoIm1ybWb6i+Gx5
	vt29Yu8cb6tNVUHNuCG1I7Kq6iNPRV6zt9qh5qwUsCc/ptxIlihvWJIc6cZ6I+6ZXTq4X4FcXCTQ4
	7SFO/oq54U1rlMMG2eLL26H00oCvepWNfOrqr0z9Z9vlqyMEY8gdnnQoK613vtar0BsFmtDfQXW0I
	Lya1hPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA69I-00000006U8l-1ijF;
	Tue, 07 Apr 2026 13:07:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA69F-00000006U8N-1SzA
	for ath11k@lists.infradead.org;
	Tue, 07 Apr 2026 13:07:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376jL324010120
	for <ath11k@lists.infradead.org>; Tue, 7 Apr 2026 13:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=; b=L6vtKFvi0BKAvIus
	Ovaz0JofGQwzOahDSHZaFeXnoe7KLPDcOZHeeVMXh/IuqUpK0UNgoTd+4plPVRva
	9VxnD/YorZDO9lvibGjmJk1nzQPeKBTxF9pmUSbCEiX6btGi1hjyhLI+SRv3gbZr
	pd6BIHnZtvpRY2ihYSQoyrAdt6PKgpkW7Ton7PiDPO+noY8cK4nyjawuyNArovr3
	WoL1qnK0WapjQ4l+JS32hJ5bAcpxb6cwvVB25Wsorp4Lm5HXYV+CS4sPPqqhrPo4
	9m4TXpTFLtCDcI3vR9Ngw5WdjqNOHpTLbgrm+qx/UBtTk8J/N23D2GX4UCguZcZA
	gwawjg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkts4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 13:07:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-604dcdfb3baso234943137.3
        for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 06:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567235; x=1776172035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=;
        b=SonOawswxuBxk1KLpGjksAFcrLVXAl3XPffPkcCVYfaI8h7OLDFI4oyd1d61AW87Bu
         G6hb7Pq7UzX3pqrnJKlZrQaNnZEz4iNwjlKyqc8Xc1yiNyT7hmEFE+ucuwY8GK9rdLWF
         ocfc49OBlkPYF9PBeOLNM/2s8tyEusNKJWpiP5ehRi6rrpdTJxnzhGR3DGkqi4oMD+Lp
         RLXwTvg4P1/+vBv0GLPyZXGwnSYg7lL3+o8BBdX4HulRIX+rtKyQMXqBUbAJfnJdoW+6
         TJUYspAch0kq1dbwdwpvQtT+VCWhXkH64xOMv51/FzwQuLRoDgFKVr4HODCC6zTqVHhK
         2/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567235; x=1776172035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=;
        b=koU1NW537/SWPQ06y8r1E8Hjr0zGEjRG7eNrAGSaib2oXvzA6IS0ArSipjazsoJpJf
         YUeFnRWxQDyJ+IqZ/vmYIaDHE21qMef1vza3LJA1dFVLmTHXB5AWlqkwXPt+zysYrV4n
         g9EsxxuFDVevbAEV7o821Gkf8bFzglHqyrRWp65lcz4z3BeLPpZIyJHjTlxeWaRUgGsw
         FRapKF+eHX+pPxzgXjKjrd9rBEVmlTm0GxGpVbVTvdFdrlYXnasT5w4OYVmwccJDzYPU
         3rb9sJjP4LyRdkidRaPWF4v9xpoPHPpajNomyRhnwxcBmzX1AjmornxgL/bKmVx+1+qP
         W1tw==
X-Forwarded-Encrypted: i=1; AJvYcCWsXCC9QNV66awWtEOLem0JkCCU5lOCGJlsY2Yps67Y8EHK8uHRIgmMC8M/UhN8lAyIX24cg5o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw033dgZzemjpO5du98w3G9YWHJH92lXFvlCupMljZLlsynDbWO
	GwpLv76RFjaDlU0QSQXKHWmnk6z+i4axWQeJBZo0oSs0c0QwNhEsCcOI2Fh3wnZON/Jb9+cVoUY
	e1qKR3TZuATLxcVHC4ZDKTw4JyOdEtaJy7ELhihHb8EWXPyQFq4/ooivuFU0dlUQG
X-Gm-Gg: AeBDieuoY/fbvK5Ck2UvCF7WYq7wqVrvGi9vFCjTabH9A6UK7uBtahvqXbUAxmsxR6V
	/PE09pPPBUMXVJ2JE0HNuFkAad8Dr0iz1LJjxyvBTtqnP4NTE7AfPZSPGvn0c3k0sFbeE5AVXnC
	XVOy/HzFlZKSjLX6GfaQCq54z/AauII95v58aN8jB/WUUm/6NZou2fduqKlvKfCXcN7cZEoyafd
	+SZ3di17XC59JuEl1WMjFMbTvraFeNmnslrTEoYcH0Y+2ksAjUf9Sp9ZZPiHil95LVLNQNpXfgu
	6+zf7VSeg1Zcq8tEkhuoSD37H7AzIi1PzRkTa55jC4LEltLJO5bnTMKymAwnnO4l+3gVPe7zfQt
	NCwB2oF7PRF2gkB8DdMmaIccMsRpL3DSbO8Z3i055k85WdWgFqL81q3SPu5+/syejac8FNSWQ7g
	EvEWk=
X-Received: by 2002:a05:6102:225a:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-605a50da5ebmr1992209137.3.1775567235201;
        Tue, 07 Apr 2026 06:07:15 -0700 (PDT)
X-Received: by 2002:a05:6102:225a:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-605a50da5ebmr1992173137.3.1775567234769;
        Tue, 07 Apr 2026 06:07:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm550660466b.14.2026.04.07.06.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:07:13 -0700 (PDT)
Message-ID: <fd0919f7-e510-4560-b355-15b86ee9e5a3@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d50184 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WCMWw2a6SM-JmIkApqcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: xDUeNNt45Y7lmcpjTOvc9eEVusbtqhDD
X-Proofpoint-GUID: xDUeNNt45Y7lmcpjTOvc9eEVusbtqhDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMyBTYWx0ZWRfX+GHnMNyjEwjh
 1jv3/z+7RtoXbgBOjJWy5R/ZScAps9SnjmeOzI3WCP9fz77ykm3+fhWwnUGm9BEeQ1dYfOWFmfw
 27L8CgFEOqmnndJueQlsWgQpaQyevPRWVXZ3arfrOL4mb3pqrCjfQ9M+GaPEgX8A7wxwXZi8Igc
 UHIfguQOYu9ac/baUFHBj3X6xlmxxZ6fyA6RJnYYaks2egnOezrTApu0mImEAHt0Dd5XN2bRrno
 5lgfjEZfEM/GK2+1QrAAVMPYR3F/DeOsuVSF9MymynAWUCpzNzSuXRJD2jRN2X/Q6v2YPSdZlHd
 R0Mm6PH8l0fOJtvnptjAP36t52IPLcU/HkrcRJiJkwQ1ZenaKPz0R++F1ITeMeHpA6gnfBE0Vvq
 ICV8vexZSZbqjvB0ga1LJL9X1TfEPynqDgkJcQbs8pBmCBHttpnGIEcDCMFueflO9qcNw/PY/p8
 rCAClPrDQZzDKXUDy/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_060717_505664_E7AB153F 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

On 4/3/26 3:52 PM, Luca Weiss wrote:
> In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
> split up the pinctrl configuration into 4 nodes so that boards can set
> some properties separately.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

