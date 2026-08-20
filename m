Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5C3C5DF81
	for <ath11k@archiver.kernel.org>; Thu, 20 Aug 2026 18:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKBy0+k7TJpzBUIpK0d3DuP58yHbMebRi/2/3eUJ/ns=; b=M5h/G3trOBLhHgQjrkrcqg521n
	QA9viRUhnI03MC0OwhpIZNu5F9STHvD5XrQBEjd2ZHpAx/MppLM9I2tcehmVdnDvPJ9yuob+/7IkS
	MnlvxxKKOHHw7YxvxoAR/rQhdEzjKS/QQX6vNOryK0qApvVAqLa1LcBMh35YLvlwwjxBNTqluBNff
	OzTZ2iIyoTZ+kR/X+VM27N5hcPyrnBhsiUcPv50k48/nQek8TSXLV5rDVk1o7yZ/REoR4pjC+pLtq
	GL85NqRZBDx0xCmTvZUqjeCOYSVLBe8xCxTRdkLSAWclaOUcvEq83CcZMtCmaWrYjS+sDeCiptgKe
	d7GIgfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7FY-0000000C1Y0-2kDl;
	Thu, 20 Aug 2026 18:12:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7FU-0000000C1Wb-2x77
	for ath11k@lists.infradead.org;
	Thu, 20 Aug 2026 18:12:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KG88jX3492346
	for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 18:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKBy0+k7TJpzBUIpK0d3DuP58yHbMebRi/2/3eUJ/ns=; b=kY2p0y3HW8RDLH40
	T3FRoWAJ2fmHWAtkPWIL/NbBXWfbN2CFSD7QsW6XnZrABR/i4WhCeoN5poNBpkat
	Uc2JPxiHQm4eBxriVUU1T9sMJNE+oxJ2MEy0yXtKOb7i0UTIUwXZoqUHM8OsTfVn
	1Hi7b0Na5218CUbo6YQr0MNkqA+kIqxS3SHIQdoodpXL3j/7+HeGIHAeQnlmdV18
	K8V007rULIV9kzYYdnzrPyTOk4wy2rc3lA8RloEBN5mGZJiEpnDQalylN3LwxXGt
	eSspdIJULnA1sFGcSeZ8WRPBFAnzouE3tvhtQtcaDIsOc3zh5J4Cq72uzQgjSpcI
	v8sRhw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29jkvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 18:12:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee8d434b8so54181a12.0
        for <ath11k@lists.infradead.org>; Thu, 20 Aug 2026 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787249539; x=1787854339; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cKBy0+k7TJpzBUIpK0d3DuP58yHbMebRi/2/3eUJ/ns=;
        b=gZI6m3GasLYsSHPVxqdl5SWhOF32yp2Ff5KPiL2P//t1aYj8+4FrfRcuKwZ2b+LJ/b
         Z9f3s6XtAnf3OAIF4Q2LX8iAchLYLy6dwVoPvOq7dp/F4ziXBl6Cr3VIVqwzCYCYRlSv
         Q4f1QvYR0+Geke/R/SYrg+znqmCZhUjDQxISEsmCphjm4svfM2/y102aLj8h5EIMrNuQ
         nGTv+zsRxUkhDE3O8SqAPx5h7OvbE9LqS9kWmhFPLnO1dWy2hOFS9RrI1mg+IsKM+ZdB
         Rw5dQ8kJJvVR7w12DVoqtObBEAH9BIdAaDFCPyHf63FUutM8FxvwvYaQoiTdPycxm3x2
         qUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787249539; x=1787854339;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKBy0+k7TJpzBUIpK0d3DuP58yHbMebRi/2/3eUJ/ns=;
        b=BlRAfLcX6EuHDjJgjnD5WNb7R+pcIGEXV1ZyfaAs6J5DZP24U1MiCv9+oWlhcGJmRg
         vczTWb4gq4GY0zY57KV79FDUusAZ43WpFFL3kJWdCgLKr4+5n/8eNL585KAg/a1m3b3q
         5k2YraJKcnND4IifF5IPn9KjCOMevwcDParUCtBBpRvzVBE1/VQh8Vi0v7fRG0rTd89j
         emYD10b+YzyMej8RZW33SQMyu19yH7dwekugdcRUWhw0qIZ1r9Hm4ElmrPxKOo8hnI8S
         YpdIaiUvAt9MuNBufwT5b1ShYbNok82H2Qn55lZJH3zspLGl7Kktfu7bNpV6A6YJlMvK
         C6JQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnGIvFg/uYvMDr0Rv4VO51nQbvHrtIISDLf+L0GjKhye0Vm8FJXATplJoHyv64bvt4vkrIav4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuKaCRA53BVpiR5sboIPFdB6NPdi2kXRtCSiwFsMBsKl/I3sNu
	xBfGMl4YulyN12zycJak28LF6U5WfTY0YmQdinUxJrK9C3sdV2LBcq7jKUJ/2jpq1dEK81/BzZ5
	oT1x7ZCT8+/Bab7RFtHiHWviE+lMySKcnQcQfEX2CdqjbStk7of9qZBkRUXlg/EmJ
X-Gm-Gg: AR+sD11CvGQWTUc1FW7bjJKE0b/4Osg/yGaFMKlVO/IjZ9ShdZKqntMF4z1Sr844LbY
	ZjdzNYJ0IRLa1cTRQ7cwsOAGqGXt4BmCPFx40qtHGJZ4TgVCzt7vQXp0VXisCA40t1vC0ViNFHz
	WQxzk1L1xBa65aEeNCR2Ev/sXn6aowjQ8SAef2XWNAu/KgwwoSBelyx7XbtGP3FR62+Pu5LdiEE
	pG7ndN4ZbG4n8UNfO8k1FBgICrm9jTkP/a04kx7ePMybu/iFZAEIjYxzFXxWsyjDkBG/ZUtGrvA
	ROrmaAdvrCTnQNl/ODCC6ynSDBDkeE9SBdM+knIcOoyjG3ZTYaWuNRjEgNBwiomtc87wAkI1MVp
	mvbSQPN3VL3Krz1erDOAY2cpp5MHvnYy5kKHF/fBjvZauIxJsMflkdaA=
X-Received: by 2002:a05:6300:6bdc:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cd14d2c28bmr9766220637.5.1787249539403;
        Thu, 20 Aug 2026 11:12:19 -0700 (PDT)
X-Received: by 2002:a05:6300:6bdc:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cd14d2c28bmr9766171637.5.1787249538963;
        Thu, 20 Aug 2026 11:12:18 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad564bcsm20080476c88.5.2026.08.20.11.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 11:12:18 -0700 (PDT)
Message-ID: <60e80a6c-c579-4d5b-99ea-c239c7048c64@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 11:12:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 5/8] wifi: cfg80211: add attribute for
 TX/RX denoting there is no station
To: Benjamin Berg <benjamin@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>, Ping-Ke Shih <pkshih@realtek.com>,
        Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Benjamin Berg <benjamin.berg@intel.com>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net>
 <20260819155703.4f0cd22452ae.I4cfd3db83ba3dc0267575f919ba613ea5d10abd5@changeid>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819155703.4f0cd22452ae.I4cfd3db83ba3dc0267575f919ba613ea5d10abd5@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Nhju3cxuKUiFeKIzFNUZ3jygJ8caFTeT
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a874384 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=hHivSj7PwCqv1rpHu2cA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEzNyBTYWx0ZWRfX+TXjZ7vbPxNw
 ibnqIJx/2XBtFd6Avvtp9N+lU55/xkrDTuebh/NO4rvXp6HjsKuf+YYrMYBGn66u6/m5G2ZsnRX
 TrHTXF9zEaUP60/bBJa6b3b1GSZ9duxUVmir68FQO4l8amIm2Rx5ZcEF43FZEPqCuTGwhg0USEO
 CiIapAGrflXfFHrw/ys92aw2ooObg4ehuHWdvqtGT5FKc2myIMUQrqcGSHgEtRxZKuOppmTxzmv
 BavwpsKE6mnAfcMBEAMZKm7GFUaghfc/klU/rvoID7TA91l5Uk1rjIVi+90eBdJMCqsdr3tIfVS
 oCyIg8nTAzLyOlcgnDbpdodFagAEcR7/a2PSDayw50O+jeC9Q1wfFtc69XyTEDZZ8IAG9JtjT3R
 5LSoOyTuscDgpNwGYs2j19TQPmni8x7fTx/sMY4e6kmsDEbyRpMKfDDPBjHTKq4PuNL9xXxlfT1
 UrQzW2BH874gkGYmmNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEzNyBTYWx0ZWRfX8xbU+mm6ndON
 x4jgrwy3I8Xc7mDDnc2M/jJ/yZztXomVsd1sB5k4WAmJCtin5XV5yzKHzmzOQpU2bTCZdNd1qKf
 EhRtWPU52jK563Eugvlr+YJyc1ltmWM=
X-Proofpoint-GUID: Nhju3cxuKUiFeKIzFNUZ3jygJ8caFTeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_111220_758557_5F893653 
X-CRM114-Status: GOOD (  17.86  )
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

On 8/19/2026 6:57 AM, Benjamin Berg wrote:
> diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
> index 020387d76412..4653f8f26ee7 100644
> --- a/include/uapi/linux/nl80211.h
> +++ b/include/uapi/linux/nl80211.h
> @@ -3185,6 +3185,11 @@ enum nl80211_commands {
>   *	The aggregated message always precedes the per-link messages for the
>   *	same station within a dump sequence.
>   *
> + * @NL80211_ATTR_FRAME_CMD_NO_STA: Valid for NL80211_CMD_FRAME to denote that

**Minor style concern:** The nl80211.h kdoc comment is at line 3188 but is
missing `@` cross-references to the commands that actually use it
(`NL80211_CMD_FRAME`). Standard nl80211 practice is to reference the specific
command and operation (TX vs RX) more explicitly.

> + *	the kernel had no station for a received frame or should not use a
> + *	known station to transmit a frame. This is relevant to know whether
> + *	MLD address translation happened or to disable it when sending a frame.
> + *
>   * @NUM_NL80211_ATTR: total number of nl80211_attrs available
>   * @NL80211_ATTR_MAX: highest attribute number currently defined
>   * @__NL80211_ATTR_AFTER_LAST: internal use
> @@ -3785,6 +3790,8 @@ enum nl80211_attrs {
>  
>  	NL80211_ATTR_STA_DUMP_LINK_STATS,
>  
> +	NL80211_ATTR_FRAME_CMD_NO_STA,

**NL80211_ATTR_FRAME_CMD_NO_STA name:** The "CMD" in the middle is awkward.
It implies this is only relevant to `NL80211_CMD_FRAME`, which is true, but
the naming convention for other per-command attributes (e.g.
`NL80211_ATTR_FRAME`, `NL80211_ATTR_FRAME_MATCH`) omit "CMD". Consider
`NL80211_ATTR_FRAME_NO_STA` for consistency.

> +
>  	/* add attributes here, update the policy in nl80211.c */
>  
>  	__NL80211_ATTR_AFTER_LAST,
from my review agent,
/jeff

