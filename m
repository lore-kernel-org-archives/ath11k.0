Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44680C44506
	for <ath11k@archiver.kernel.org>; Thu,  9 Jul 2026 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH4q7BWi2hgwClET7u+00rOznpP+Ykf1PL9gpdCfoHs=; b=Zgfo1e6VEKdDVVnMIUHCfWIE1F
	3lUpqLQx5tmPoxFLMN5kaseOesePeL3JtvyhpygXNQR8tMtmHdx3thb+Nz7bXiH6Y5TKjE86YkjVv
	b0LLz3nnFWQeR914ojYV23EH21BA1455KYOyUOcK0NA7Ix6UeGfKr4QJ1/Nh3U5t3sCBQowobDy9s
	QHmOTktJsGTECkEIGVv3gD44lcY7T5noYM+QcsIbj2g4Jrq2VF88lO7bQ2Mhgmhx8JclcXrKSlUy/
	e1ehiG/18tJOovCoBwvBiRR7TBvzvGUtwvib81tIs4NsgB5yGh01iJMXaGWtN3LHEOyez1LFKSpQ+
	0RnOCqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4d-00000002pdy-3ZLA;
	Thu, 09 Jul 2026 14:49:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4b-00000002pbY-0J14
	for ath11k@lists.infradead.org;
	Thu, 09 Jul 2026 14:49:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwGei1971159
	for <ath11k@lists.infradead.org>; Thu, 9 Jul 2026 14:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zH4q7BWi2hgwClET7u+00rOznpP+Ykf1PL9gpdCfoHs=; b=H74RRCgdHLu2YCyC
	DPR0TxCBM43IdK03QWzGeNG8SziPIBWoNYgwWq1WJNV5k4+xPl5S6kQ15LEjGYhb
	fECYv/kQWhU83PCaXttlWPeiFZEbhUs8yVTtknVJR4ASUh/RsH905Yken/P1dRD1
	ba4gMbsJvzwOUM/+pRWNndwGl6UWuaUEFmRrq7o0Isq5cUPqh0GbBqtqMLVV1At3
	zSF+oU3DyE8435JKNu2UErzOsSeGboKJQjMjUMUZGIa7fDdNYxCilI5Y5g409vQg
	ngg7/OjMzyVMasWGCbyJUWUfH9LR4IFxJxzdeG2DZNwJlb5v7mE5stv3wfgBYlVk
	ua83lw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpgbbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 09 Jul 2026 14:49:56 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7fe835353acso14941087b3.2
        for <ath11k@lists.infradead.org>; Thu, 09 Jul 2026 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608596; x=1784213396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zH4q7BWi2hgwClET7u+00rOznpP+Ykf1PL9gpdCfoHs=;
        b=SLGwAMxRyzjLnrxeWBv+g3S+n9GbLkNTtMSfRVwXHc5+pwsYq7ufzfHub4klSI/VAl
         /wXi36OA4ZcXo0pD2y0VN8rqEjU4WvZormLZdVfutR+8v/8KiigKFDFU9S42QJYipkO4
         dWNVXmMwpxVo9BM4T8SwymqBMdJZfkX2UiO9gh1v8PCJWMxAki+mQ6OEFIdumPIWr/XF
         ndWlUfGshXAHFBnnf0kYKDD3/aXZ8V7kT64VrkFrdeFs3ISUk6B2X0fw97fwUbzTxbwK
         f4IwfdI0Ek2oDcGTV0FHvlMCl4Rix+NHl34YffWu2a/cxbp9HwNL319X1goO1TL2llHA
         3LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608596; x=1784213396;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zH4q7BWi2hgwClET7u+00rOznpP+Ykf1PL9gpdCfoHs=;
        b=NQ6cJM9cmUdu4LC0R8jqSHOr9iE0gDS/GaSZDzrO+Txa/X+HXQTgyXoo+EyFn5Qd1U
         WW9W2+61sGVTJy+EELKEPvOcFaA9XqWZaDqogUhFyHcT12GrTXmIR0F03B9p0VP9lb60
         c7h8nYNVO7drku3+OCXj81dHR2PeRxUloHNwHUL3P4LtNDnGD0TtayPTQ/MKkLFQb04K
         Iy7MdGviKxAi4735JoOWU1loZ2N3jg6e7WnB9dUwA+Xlh0INm8vli6KI62nnR3ugdPsi
         5I6RECscd7/+wPI2pp6lQagKHqwwOBUO3ads3G/aCKf5Na0ssO43HqLFL/5IlCawEdli
         0asQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKgPPy1f03xlb8dyeNo50m8HWoFCfdo+Iu6cHOr8fFCbHOMZuNqvD0ZsbTxMN8+QLO+9EiI9U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzCxdbnFnqId6FNmA5DkUHzxB+rvbFDK7OyrJQN/YfIvhRsWeU
	WVEWuo0rKZWUU2L3Vr52I0h6TUIPGVrASSa+reC7tu+OauQsBMJvZnputzNcqE3Ul4QA3GGWhC9
	2BRXuHzfLJLm5Xgm3Zeej9q5KTOj/v6kqjBMtalng31JAfBMcDaPGN/OSXdZcz4r1
X-Gm-Gg: AfdE7cmt93B4x2hsol0Hvbjd5BDZIncEEddus0yHGYtanLscen1m5XsWOMacAAUvq/w
	ihYzbB+/JoK4bTDrgCHdVOwxYJh8DCkNliJeFYH4M5s3x5wJMzkCsrdPIzWnBgdzKuhOThpp9dH
	xKN/vZcGp8uYof4fk1LeMO9yQuvHJED2sauOqfv89USxX7svfjLpzS7fe6WJJ9rkt3yzhoswAxM
	YbETUX3JIs35cL0dHcUYTSR70gM2gsBErZzxXuLJE2CfXK+JNp6jmnIqBCbYr/H7wyqYuRWsx79
	QVvigREosgB1WCqTsEku5hMrt51BPyGnmM02uBQvQFIVSIDcaJjQVz99E5cDJKPvviayYHeFHor
	/2+mSiY5hX1k3TKGX9hs7oNNfROf/zyzrkZZPrsKq2g+HxKobnAceAzOj9a8OLmQxxg==
X-Received: by 2002:a05:690c:3707:b0:80d:d0ab:6d2b with SMTP id 00721157ae682-81dc0be096emr63289337b3.53.1783608595740;
        Thu, 09 Jul 2026 07:49:55 -0700 (PDT)
X-Received: by 2002:a05:690c:3707:b0:80d:d0ab:6d2b with SMTP id 00721157ae682-81dc0be096emr63289107b3.53.1783608595327;
        Thu, 09 Jul 2026 07:49:55 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7795988dsm4989277b3.26.2026.07.09.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:49:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
In-Reply-To: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: Flush the posted write after writing
 to PCIE_SOC_GLOBAL_RESET
Message-Id: <178360859334.1031194.3081866596289507374.b4-ty@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 07:49:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX21a54vQUwjtc
 h7E9DA98RJqx2aDw8+zUzQDoSdkRi7Lewg9CJ1b5HawoUF4kpp6X+OgN7d9MAYQKoXct1ghpWe9
 ePpA8NcPvfIakbuVQaw9u6w8SdVfti0VPXj5rCOKW8BmxfRgl6UQt0L3CH+PfXiQV9xWugTQ8eP
 7zwEzHEtEBL6MxazAWKHK22Y4J/12YRCT9yaYt0IEjS26xRy0N4tBmjqpRiF9B9kyUIpDKo56pM
 7CJ0s4JXF90x0QWrrwUbHpqpwG7sKoaZpbwEIvmO3zc2UF7vb2mPNVwUQJFEyEqEtB4Wz1GVvy/
 h5fXkbcHJAiRX2YVS2eDzGQ+9FJif3umQD5Yo0SCMToJxKAH/I9yT0F5Ai9eNlCkasyEX1b3rB/
 VG+RBZFfgiZB/LM13PmUanMIgklbN7Y3eUVvnGbiBzj+IMcfFQ4ZdZ/wd3fXj+Y5falBOauR7p5
 OKWNKp4HbAYJsVrxL/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX5iARQdrf6haQ
 oxuad0YmqRjwhzvnzdRB3n7Br5YDmA8nV+z/gZglrrtdQrk3fNTgQ+9bSG8aNLV5pEj5uN0v4ui
 1Rwj5Jbqu1IP0TBqPjg1erZ6BYf2VI8=
X-Proofpoint-GUID: CGsDRcokvrqIa38M_0pYgUL3x71VSyQ3
X-Proofpoint-ORIG-GUID: CGsDRcokvrqIa38M_0pYgUL3x71VSyQ3
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fb514 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074957_260245_FE93CA96 
X-CRM114-Status: GOOD (  10.53  )
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


On Tue, 23 Jun 2026 16:16:48 +0200, Manivannan Sadhasivam wrote:
> ath11k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
      commit: 0fe8010fc5b147607fc19ba010ba469afc95f35f
[2/2] wifi: ath12k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
      commit: 55f3aa06951cac78b0206bde961c8cf11929a27a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


