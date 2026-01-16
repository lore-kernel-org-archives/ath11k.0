Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95316D4A5E8
	for <ath11k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHvpl0cOsSAPRSO1Igx8dlMLkSJkUG1m7ej0v0eL2VY=; b=USAWDe/LdP1MteXTqULRqMbyCb
	6G4Hey9zKHvkwRP5kwMSomIuoEnrDiQf3vrW27IxSj6seisw8Q9yavor08kMSPRpo0UNRxEsUYyCc
	sEg3oNW8G89WPxbC2mwOFbBpPqIeqPJi6q2fnDaeTUgIHeEnH17zxOP9u6VXOygVXGJLyWGBn+VSA
	hZAQgy7kOeqqn4XH8P5DNhh9iMXaRUJ8XTNmpaPC9GNwv3voPxCAGgtUw0fcdEUrODOPUm/7Ouvvt
	yKWo+/G1Z5Trly0nTtUvTGYldJwk1md7QRxAajtJAJXOLzuA1V0YK3jRCyR+Cm+iTOJZ0NrEDsvqi
	zFqVbtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcL-0000000DQ6B-0gPp;
	Fri, 16 Jan 2026 01:27:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYbw-0000000DPz8-2mrv
	for ath11k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMcchr4100521
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHvpl0cOsSAPRSO1Igx8dlMLkSJkUG1m7ej0v0eL2VY=; b=B06C8vwl0TA2dTwL
	79HMs24/72z8faPrGXX3/3rhxK9IxI/5GQYbJ6SJ/at3nRbXj/0hHenCvaeh2Kqh
	uFUZBs29zeACJslZ7G5Z0MM1Ho6BPoMfUwP+DKQtaKCUkFJKBBnbJ3ITXcMBkTRJ
	DhCuigNc7yEhG46B+H8m+YsjV+GmVHxA2tTkThbyioP0xoaQSFQklha3rLSqGs+a
	rHWEL+x8RiYlE+9KaHBb+nYVYNUGafttnI/qEmEK5MVtZPR8szvt8m8hF95LmMV9
	ldAbA5CY8owqem9Rmc6sUCWN9t1JGAZbxiPCM20ffjbHmP+BdU3DARh2/yAydKep
	AoiWOA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9750atp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae26a77b76so2957917eec.0
        for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526806; x=1769131606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHvpl0cOsSAPRSO1Igx8dlMLkSJkUG1m7ej0v0eL2VY=;
        b=G28vBXRfhtPRcELkHJgiKM1Bg71oxvuFJ1GZ+dXA0NMG8HuQ7ENQ9WHCVoysyie7er
         K8aM/77+voSJwsdfv1bo5qVQys5OstRAQKOobjh4bhwesexAdUCO2kWylej281DI+WIe
         Dr+Lazav1DQxv+y1qJB7BT4uDqESRuCHxAWqGxidEJtcUSYhklO7/EbTwc9Qf2CIu7p2
         SRVjuROmnsAvk21cQf8uEYBfZxwf4l634OpZDNGCLqd8GjNmrKNg5kYpnFPeIdOJ/5Y0
         RLjzKd48GZI8ca95PNT/ZxV6eOjQctvIJ/PDzP/rGB5iNDF5ktZksapS8SADWfVJaCbN
         mlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526806; x=1769131606;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KHvpl0cOsSAPRSO1Igx8dlMLkSJkUG1m7ej0v0eL2VY=;
        b=b6gk0bJ/2CFM3uG0woxSqGJq9Ctml3GFl8hnwzDp4IihPzxAWheJLgcSmpIkgtYSm3
         RPbXTbGYPdiDUyFpp31BLjX6dLC7MeNhXhpf0M+hmZBak//ZFDCtuMLQHEFfVtBGFLtS
         +wb3Sg+YqarAARIelkzw5DqJ5KmP4wV8wc873YxUwXdjXM/dJeDuCSLrznc30eXUd+5p
         GJwUs3cpGB7X830mT5b03zUM6IoQBVQwhMf62RXqGxJaMeT8BhEr18XJMkK916WMJpYH
         5GVv4eaA31y6h/7EHzIWfx4Q4k+2/u8Pdzxlyxaf5zHlFxvLlD0/soqrLXt+5+aEkcqg
         uwCA==
X-Forwarded-Encrypted: i=1; AJvYcCV+7ydPagHcHPvl0grR1DiP2O2tCa2yQ7cXXTbNmZwKNm6508WQrCdNoPzf5623jS/AEk89OoU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw955SJ2j7HDsApZxfpRbBY1TzDzzxh1rz+YdJDUZ4JfAuN0ER+
	gYCt0/46C1lYttJO/S3h9tk4N3HnLMvrdBmyUudjqOKtPDcHW2b7HGdHgAfJ6SFvjhEJl0dmiya
	kzAinawntufH4dZfZJi10wf5c5WzMJeqao2Q7fNMnPTDQuz5J5TiAB4JurbNrDjdnFoExpMVB
X-Gm-Gg: AY/fxX6ODzpA7Pf4WlqnbB/2LWnL0JnQOykrsmY7ZKcmO56P0OkJxRQ8Tt/MqFMQyp5
	+5E6gCK+5ITxbSuq/itOHQvcIxqXOARPEDTgYdaBKJy5EEDccgkogZdHPGYItK92+prfmGiKGJL
	cXqjNt7fooblNWDFhgWBLCpXBI6XKCUX0L3m2cdy4UnR8l4zemM0cN4znZBg+HKyZIWfYZD/Y0W
	9WsZKNbI8hh0FRgaiLaiFKTjcYLE5eidW/5+geDNhuFCk+X5zuxTjDt024CEy9ZYETvjYznZg9n
	rOnSXbqHOdCit/Q1icKbIqWq9aXD2L8WV2sFw1I8txUDIbMsXDU6ovzsBXicpywActDRPIyBtyg
	Dmf3ukcSM2HipkL9tuhqNBho1wjU5Wbwx+Zs0LFaUyHdsid8hQb/Ej8EAcNXnhjh0
X-Received: by 2002:a05:7300:6d1f:b0:2ae:5cb2:cc11 with SMTP id 5a478bee46e88-2b6b46d33b4mr1526113eec.6.1768526806332;
        Thu, 15 Jan 2026 17:26:46 -0800 (PST)
X-Received: by 2002:a05:7300:6d1f:b0:2ae:5cb2:cc11 with SMTP id 5a478bee46e88-2b6b46d33b4mr1526086eec.6.1768526805328;
        Thu, 15 Jan 2026 17:26:45 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:44 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251230114835.52504-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251230114835.52504-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: ath11k: Combine two
 if:then: clauses
Message-Id: <176852680474.1143034.17152758892782135246.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfX9RsEsPCX7Ucf
 sN0B8/laZRaxo9lmgHgxw3cwUBMoJ6MQz5u7sAkle/E3ztg0bwaT+AOujDG2efXZUQEUyyfvg3e
 zkgChutRKpY09/6K9sBHpJQx6lf27WbYHjGQ585wEfyRSVLfchQV4zgAFdh+CCouaReZHfjtrQ9
 7MyAU8EwqBQGcJytWZDY2gjDOyJ6Gg+CY7pa7zny8VnYZ/KU/yTO+8KQDe6MkTK6AovHS9xUQ3x
 qA4ShIFwmxvFfcyhaG7jyExJ5RVFkyW6i5tU135HaBhH5svF94rtgKjRSzVY6B0+ynCPsTGMxAD
 tDY77d7HI2ELgJL+YfbfahaozE7piNQZcI/sStPj3NQwQFFDwz5EEyVblOjUSdc40JW/sRDQBRy
 VV0pcsUt71GOdJWumdn5TOGtTPTqRI0hIlh9qq746y/gFdgSXyGTvJ5e/e9EP4IKGJRc8VcI4M9
 tJwwxgF5BQTGkHdbv6Q==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696993d7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YCnGg3YljQHaMnv7sjoA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: cZJKUjayldKeiCJMYdQK2CTb_qI8LRIs
X-Proofpoint-ORIG-GUID: cZJKUjayldKeiCJMYdQK2CTb_qI8LRIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_172648_724979_D5689FBB 
X-CRM114-Status: UNSURE (   7.36  )
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


On Tue, 30 Dec 2025 12:48:36 +0100, Krzysztof Kozlowski wrote:
> Simplify the binding by combining two if:then: clauses which have
> exactly the same conditional part.
> 
> 

Applied, thanks!

[1/1] dt-bindings: net: wireless: ath11k: Combine two if:then: clauses
      commit: 2125381d60c572684cc4ca61a2b1cf44c7eab059

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


