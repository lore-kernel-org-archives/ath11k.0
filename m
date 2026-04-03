Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6EFE8538E
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 19:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miF4cwndo+UagGtGzMGwU83nO7jsT3rW3iUuyZWlKVU=; b=rCP0ztqr+N12qFsnRd8N6NMXqu
	Qk4hfmYES60h1fT1cZ0doNsD94Zz23NdMx9Rvek0E3MsB/hVu0cI43idJntwf4W8XnQ3H4lErFPIV
	cWXEInIKoQ0YzQ4K683lcob3N5o4PEIax4amzIk8eP6gfPUHE9YWAnAjc9XunDsyJmkoV3NBnueSR
	uDkhaZO2NY0IBJOKnQZCejVvXIjgM7cntM75I1mKUoEpf8RbC1KBNrJ6eKuZgj8CK/wCaQMx8TCSu
	poZdI6oBP66KK8Vr2XxWLLvI/gZ8iOu9H2svOC5grR3Zu/3b5iK81YtPkmBKCq1Kjp8aCCXiJetdc
	V18pD8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kG0-00000002U7j-1qyi;
	Fri, 03 Apr 2026 19:32:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kFy-00000002U7M-0SLZ
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 19:32:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633F6a8v947651
	for <ath11k@lists.infradead.org>; Fri, 3 Apr 2026 19:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=miF4cwndo+UagGtGzMGwU83n
	O7jsT3rW3iUuyZWlKVU=; b=OA9PLhXO3sLjtUco54mVLdVYVzlsxNPFOMTCF0EO
	LJRNW37pUdeK16IzY+5UB9lxjbNEiKMZ255B9KWDEK9upEArlemlVA0pa66B+XC8
	AGZcVKTfoADssrX6+HIPdCfFPyK/RNSUPN2imTcGA79tcOEnMMd1eU8I7f9E5Ar4
	NUiaYfdQztTQvj4YOoVI1UCrfEowqctWrX1N3NOEa1e+5NqHf0usFgfwvSX+A/hN
	eWkYdlNx0HS+OxGZwwFa4wJ/xAutWhMcsrLTfVdxHoAlIvRItm8jFxYJ4KvQkAsS
	vTGVwQ092tJGGTF2D72fv9VKh3SuK6h53aMmNILvWsTpSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfkqqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 19:32:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso105577611cf.1
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244755; x=1775849555; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=miF4cwndo+UagGtGzMGwU83nO7jsT3rW3iUuyZWlKVU=;
        b=jhLy5y5fw3n5dTnia7HivA3VTcsb+DEeNJCrEA0HeHGFIQ3+hvjK0ZU53zWE6E621S
         psLndL2K+D3T1UvUpGturlzG1XdJVmsopbnU0ekEfn7PMQScOmNHdJugHYwqXABPhdka
         MadZzkSobsUHDtJGXuCItwCX0lOYaJGxqqrMbpcb1Xzd4dle2ZOQwfagOK9KxT/uZu4j
         ZuaYl2f+ikgDHhgCwP6zryOAPq0hElgNWmHuMzFxPnnmAnKNMHxhOWWgXco7hIt6CY2f
         pKV7yBM6yY+9VOsl1wf5p//VxvcJuln+7vadbj9PQhmXnhJHMumimy6AzdRrjSVYjkL2
         3ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244755; x=1775849555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miF4cwndo+UagGtGzMGwU83nO7jsT3rW3iUuyZWlKVU=;
        b=hiT18ggjZmvb4VbZxVvGn3ktr4s5UzTMeWwgOeIiGcnQ+L3BXGEbW3cyPdBgyQPJZU
         /4Bjeq0CsGzipmpDceOk6rht9EHfOfMYYdqpr6Resr1aThMElj7RXvklaotX3q7P5vb+
         jqYhHlDegcnnUyoZI0GQ91MPJrrsH8/IMDt5wYo0HWzNy2GwX1EfNeUZ5/Y9etCDOAfb
         iT1eqBO7vjbOlWYFWfpbD6wkHqo1JRJ7marKxWrDvj2P3jpdaupSB7FsBaZD648lVbgd
         +l7uri49uUqn+G7u5rjRkfDne/xl+uOHIvka4bkA1Wkh/kWK9ungYpTTeiRo9EFz4iNs
         Rwjg==
X-Forwarded-Encrypted: i=1; AJvYcCUVvHzuS8kd6uni9UpurIp2n+5uNh9InGhteShrrIOmVmJaA+UY41ijuC6hM4t5FUWn9YPAVDY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh9onR5VvuLNv4Cl8qw+CoYynhD7yXWZmS/R7jwd4ylWoStYQc
	Cz+lRnB7Mkpsu8pCDPh33CKR+lWYVNI+Iqhycws1gB1Rzzfb2FVg+UyYRaiHZrCejaE1chmpkys
	KXhOa4f2yHn1bJNDaebBW3xZmgQjb1O5peCUOG2jziuVdnNDqwCz/FJL0ojznOjx4
X-Gm-Gg: ATEYQzwRWFQODTVFtUwcuS9SArt2SJsv5ux+IJ72t7a6XDlkrqUXYv/CKNTK/EQliJ2
	J6Oe7T7UoYW4qW3A4Et3Ikn+wGqHdAHRLFQtqgzk4jvna/xGGBrRQ0adZVC1NLcSUL8cb7/PFx1
	2AVa9UoK5A9BAqigW0Ib5D7Q7ywvX2crlNQjAvDbvLlU7S2xAAFlxyYHGTpqELhaqqSGQ1270xw
	Rra1oDkIOUF6hRXhBsrCUuuVHlD+K5Q8blfE438gDg6slLjzR/8yUwniSYRnNDCHslCzkspxyrQ
	kVh4+dK+YFnmdJ+PreaneA7RXkBSViOg7WpCULmSrhTE4l7BbPY1E5cqhUl3PSErU9zcsKoTmyU
	5sFttrBnOPfySJ18DIesS8qo8cyY9FCGrNQobVJgFqlSJFbNVy+Ahj/RAqJOtJLqsKWHrsgAVxM
	H1MQLNt3DMw8VY01MXy7haO/PcwoQUdYmluNY=
X-Received: by 2002:a05:622a:4112:b0:50d:6e4b:d8f4 with SMTP id d75a77b69052e-50d6e4be7edmr33157511cf.21.1775244755193;
        Fri, 03 Apr 2026 12:32:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4112:b0:50d:6e4b:d8f4 with SMTP id d75a77b69052e-50d6e4be7edmr33157031cf.21.1775244754737;
        Fri, 03 Apr 2026 12:32:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fa8a79sm14362611fa.1.2026.04.03.12.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:32:33 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:32:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
Message-ID: <ep7xrcp5pvtcepq4wmiy7p2qal2qaupz3pae2cxopfnqwxqtij@ftzlldtpowdg>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
X-Proofpoint-GUID: OAklWDYHnLWzMeVoCTaFnW9tWK8wb_Sf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX/vRgAWZ92whi
 pg2cjjKhsICHIq9zSXJFg2/CqtSDNbsnvTy3GCk/kCmGUujlHg18oMrvKpIpTb+R9cVioREdEt7
 3augmKSD8GEXQNynHe7x6Nz8FYrQyDwUglWTO/B4jV2i5hNXkLKpNBKE/3x34JZKJxHMLAjUa/K
 UHUN975/LmTK8pWhq2HLx4mAlMFA5TcIUwLCdKeW5uT+hN3GuqnxJhy6CfehOwUt1crWb7t8pgx
 7tq0QlLsYD4rxLfM2s2z5HAyMnDJ9cM2uaV35uweOODiHa9SpnK76LZKjwU6xdWgMtw7Vf4hcUC
 kPtwKK5vLMevX3q8gViby3qSul4Jqs7kU1AelWx/rRZp9790AJorsfuyROskYkeKTsv7SOXBNeS
 9FCrZjVlJylkjz321cQYymS/xzjnrRfFt+tRkbAj+/Mqu/imAZeSX7r8CsqNT1mj6YK5/D9mLgJ
 6PkjRc20wzryT3iCsyg==
X-Proofpoint-ORIG-GUID: OAklWDYHnLWzMeVoCTaFnW9tWK8wb_Sf
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d015d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=WCMWw2a6SM-JmIkApqcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_123238_162741_70FD3116 
X-CRM114-Status: GOOD (  13.69  )
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

On Fri, Apr 03, 2026 at 03:52:50PM +0200, Luca Weiss wrote:
> In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
> split up the pinctrl configuration into 4 nodes so that boards can set
> some properties separately.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

