Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98258C43458
	for <ath11k@archiver.kernel.org>; Thu,  9 Jul 2026 14:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPc0PsftVnE7aCxsCXlTpMZErMgufUZdgPI6m9JGZCI=; b=VW6rr1gaiBJ8gDz2Ujul+sgOJQ
	giUvLuCLKB+WlGbDiLj4WKA/2GWYaNAodrVekYt+lgHV0xl7wwhBgePaL8PMs/GmsiQWEtdZTy1Qr
	N1SIgC0XrMMI78/gGvSbdBhUVxYWqBsj6yVQI3omEsxURllmN5HyZzDxFKuAMWUiHzWZJNDyOQwtR
	M1JEd+CAWvMW3Eyh/PT5qUXJFt5yBH6FOaVtgpYASI0PAS5+B5LZ2NZwKAUbamfEWwznAWoP/d0xR
	7chAsnZPod3sWlmMVHEgfGz6kUZHDdjLCVAM5p/iY+7GHhPyfV+OgjJiQ9ustXzfD1EpAEC5PeUzT
	uHrC7Kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4W-00000002pZV-2PgG;
	Thu, 09 Jul 2026 14:49:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4U-00000002pXv-1QPl
	for ath11k@lists.infradead.org;
	Thu, 09 Jul 2026 14:49:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw5dl1919459
	for <ath11k@lists.infradead.org>; Thu, 9 Jul 2026 14:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPc0PsftVnE7aCxsCXlTpMZErMgufUZdgPI6m9JGZCI=; b=fPA5pYyNklZM25Fp
	wQRw1vQ0Y4G7neZm1mAQtuYkmTCrEFluWcYezLBnR+TXuXWz3sjBKjuC4iHIOSFo
	NVP1NoPzoyAIXCMFiQ3FI3CiZ5PjTdcKFzKoY5ZrzYBBXXOP14Ic4URYMCnN+YGY
	oQkkumOApJ8fiviySsicS9g7torJMBXCK8a8fJYXCUV+oAhVtF/6A9hCLMxXHgnY
	zs2sAXq7TJy5zJZmS8f99dOz1Vau7xrJo5D0OxdCHK/Y1MW7Mn0KT76zBSRAEiNn
	GhAVVaPLKeopbJo6t7UX+dvkcE5iO3uWJMaIm/Z0tOrYGwjjXH1SeF5eR32KtlK3
	l5Ro9w==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcts7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 09 Jul 2026 14:49:48 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e735bcceaso6725117b3.3
        for <ath11k@lists.infradead.org>; Thu, 09 Jul 2026 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608588; x=1784213388; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPc0PsftVnE7aCxsCXlTpMZErMgufUZdgPI6m9JGZCI=;
        b=fVuI23Hb2eN7Sy/hfEWRHt50CffwbhH2r8MtYiPrKg9qhg3GEZGrztqs0iXOHbsMMo
         ZpnoFqTUUQYNqZkh7cFuNv8zhmAjaMRIAftHqM3eVDvlobVwHhZx0iwXy5KaENG97RFK
         QMyVGcXNd84/l2kZZ5I8t19eO+e5F0B3Bo00K4WIaqn5Cc/pNbXgzdARqkG3+4izhW4p
         TjiTWyVM5cbtlg4vVDBeJEyCaxgNIYTD9A/BySHyl4TWuDPXU0P15FbCklzk8eWUhTxZ
         BCNq5+nZe+TPC31+jnuA8X4gElzpcj0h/6rHXoH+fkKQObs8pWUX4SFhBDObBLIV5I9e
         v3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608588; x=1784213388;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPc0PsftVnE7aCxsCXlTpMZErMgufUZdgPI6m9JGZCI=;
        b=TQfDNh+EBshjCJwUkJr88OC0b3H5cTYa3yt4lslMxYCbffPSrpy3Jki7mcYwvCnTwD
         tlh7HAZX36G2sxnpPXPXSkHuSHnsNlSGNDx0ysXS51S3WgJlU1JQ9I3Qv8LoB078AzB3
         5m9oVU+iXLxYi+Nbz9PdAUBCkAA2eNYZB8fUf7Pzonw+gyBWH2/NnPJ5oHny0SHeEtgm
         b48ZeH2sNMcMpnyVstfaSn/baiNexMcTiY8agI4ghqwsrx10VHn680i74/1hw+LGbAPQ
         phEvvNeYeDvidJ/o+koypuV9DH4xAw2zPtvWnShSBpV7mwOZM0Ab9G6PRnzqGgfQ984f
         NceQ==
X-Forwarded-Encrypted: i=1; AHgh+Rox1M1841/hBOpWZtOG4ch5e+HovuwTqJXMM6y1Yo+Ie4pHCz32KJbeZe4Z7d8dB5TjrS3pXLU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/3h8wKOOxk/cbJn1AeqhnBYuiIe1s6Aws+RyhiuTetYK5FdYE
	148KlEvSoUaYITAihyNv/kEba5sw7W1C0GXkbZukKek0pEuleTOK98ZuNyKogua6PUuVwyjIo3V
	p7I5+QY98F5HTFX/bPvi8Zf2/ZuC9U1Br8HzjvOi4It/+PIJ2/MKBuvbn7V5O6rcS
X-Gm-Gg: AfdE7cmFR4oxlB3oWiQS27ZXThkgJmE2PoBZnNtH+0Zo5nle7dNQxQicozUYyuVtTNO
	AMyNY5ODBZ93cPolG811MZHwvrIPAB1H24XBgYd7gh2YmIul/BzcPuUoJeWInt79uxRK06E8x+J
	wZ9KfleOXDDaAnWFNRvUamovwPejZo+litEFz8n3mEVnLL0OVUXaCHa6YoxVuXwN07OEZA+k5Ad
	Dt51fCShAPzFPNN7493QZC3IsLOigKF+6n6PDNFbCqzNszAHTMwhyfvAb27ssvSZzXMenLKVlDx
	6NWj5gdwztvDBFphyEDHEj5hkxcOC9d7nMkc/Q7liD3MzEqT3+xZ7VdWqm8xJBYdg5ZI8/kaqUL
	jW2mJ0KZS/5Y+TeUXRZKobpIz0LmjROpYM6HotkF13pSkoOoYlhloE8W4tw1R53EVDA==
X-Received: by 2002:a05:690c:6c07:b0:80d:15a3:7b1c with SMTP id 00721157ae682-81dbc049eacmr66480107b3.4.1783608588523;
        Thu, 09 Jul 2026 07:49:48 -0700 (PDT)
X-Received: by 2002:a05:690c:6c07:b0:80d:15a3:7b1c with SMTP id 00721157ae682-81dbc049eacmr66479907b3.4.1783608588060;
        Thu, 09 Jul 2026 07:49:48 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7795988dsm4989277b3.26.2026.07.09.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:49:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260609092528.220547-1-vulab@iscas.ac.cn>
References: <20260609092528.220547-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] wifi: ath11k: fix refcount leak in
 ath11k_ahb_fw_resources_init()
Message-Id: <178360858649.1031194.15594754786646144074.b4-ty@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 07:49:46 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX+3RSXGcCfbyJ
 4Khy5UeSkC9/r3bkAI2a/+G3UBt7Sn4kTMVhnhpPACAXK33XaOQQLuV4BdWYL47y0YEEjLx6ZHG
 ZlpgCXKmRFOyeXHj5+P9UN9CwjxjnIVwoc4WiAX4wdQv9SG56hv4Ostsrl7KVWQ3LcTCtOKjtoC
 zwo6Zg8Z9XTHyPwbUJsE2s/HznhmG9xANim7lXFbuFipx/lyRRzgBkRejZXd49wv7MO8FuEBwVV
 CwRu9CmAmTiIDVwtNYEwpEhDpn7sJwJ9qhxDvoogcFBR3MJNLWD2YK4bbBj1wY9RRLjZ7JMSNc8
 KCTJNIERZyw1IQ9iD6iWPSo1VLdh00m0Hr7ghVpFGxXu/R5Jr7q4ZZfyWOHZF1dKp9GVg+mQPy0
 fNt9saI1WhJmzhYdaZzhnzuEWe2mtmx3PUsNq4i1cGtNkSAuFIAXoYlOlkxU61ib/z9nb9a6lAJ
 nM4zQ4CCV7sZeFEpC2g==
X-Proofpoint-GUID: GpeiWyI--HraI0h8z6IZCwjdKFsPIzZm
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fb50d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4uP_mf1xeMm0amWCCpcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: GpeiWyI--HraI0h8z6IZCwjdKFsPIzZm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX2fUT60rCEN3e
 nSjTBc0MtakDcKgA4gwT8KfurKhQ6IeMINjT0sXWUKnGKFBI3rMIo47gFmGC2atAHZ/yDXPeXu0
 lkhajrmWlpvcYDWI0R+RmGsAwJ6nG8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074950_497349_C3C907A0 
X-CRM114-Status: UNSURE (   8.91  )
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


On Tue, 09 Jun 2026 09:25:28 +0000, Wentao Liang wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, but the error path when ath11k_ahb_setup_msa_resources()
> fails does not release it.  Add the missing of_node_put() to avoid
> leaking the reference.
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: fix refcount leak in ath11k_ahb_fw_resources_init()
      commit: 0e120ee0822b7cc650bd7b29682a34e137cec10d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


