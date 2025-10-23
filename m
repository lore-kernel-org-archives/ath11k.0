Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A3ECCD1BE
	for <ath11k@archiver.kernel.org>; Thu, 23 Oct 2025 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyLhRpTfWJSWp2k1SpRF7RM3OwZDTZ2/ogv70cQxLHE=; b=tqTJKK/pxxU8vPP+hNHalzS7YC
	v3si0phC+guk385oHmkxxEScI/weRKFHsoejKcRZcbTaZ6qBtAMO7a5UZ6esaL2b2jSz9kOR9fUGt
	8+gxrvZtvC0qjYC7TnG/qrmtFATzQtyonnQdIhgfI13qapU11s/HTpZlVRROe9S+nQgBnmvvlbsx2
	oBKWa4wn9TgbNqPDUYuAUiFx06H7T0f19hossN6ztLNFbgzG+lD0sSVu5FDQ7QH8EtJo7Ocysb5Mh
	2FOc4Gry2AsQPS6L9O9XZVlUgZksw46JEXIGnezjdNJX4VqDRm2ZwJipn8kkOCo9jEUuoCSNSzL/u
	jqogmBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvum-00000006W9B-2aOg;
	Thu, 23 Oct 2025 14:03:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvuk-00000006W8d-14qD
	for ath11k@lists.infradead.org;
	Thu, 23 Oct 2025 14:03:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7iUYW022503
	for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 14:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyLhRpTfWJSWp2k1SpRF7RM3OwZDTZ2/ogv70cQxLHE=; b=kHUSZG/dvXoiuiBp
	PtGQHMFpZVdCOtaivIad7rXBtbNZ1MO9+x6wsULjtXFCcVjGRjMR7I54O12TyxZ1
	zySkt4An/Kexb4rO4YJjGiOrMhLqgOLakdaVp4fc+H/KatzdH/GSFNq9snAvvo7S
	YHp5JEOVz78lXSlf8e3Eq9WpKOHafLmls+ZYpV3yPeHxG92GmlmjJvgjVHqT7+sa
	mE3L8gxy8jUB6YvCKjFG9VKAjigAfP7NZXW26S4AkLbzZ/zuoAg+duy8k266ajJL
	39xPdctXD4YT9otrlRe79XKyfwzdBlM9VJQoDKVBuXyaHiWWSEqylTerhBCKxmdv
	o1k2ZQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w88mx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 14:03:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befc08so2209551a91.2
        for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 07:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228216; x=1761833016;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyLhRpTfWJSWp2k1SpRF7RM3OwZDTZ2/ogv70cQxLHE=;
        b=hB2eKc6ABQhKsNEMbjvllshwiFHrh8TIP+3lIFb9c6+k5tx9drBM2dbvDtDFJ0LInj
         fEOCe/13w20EzbI5o3f7DabBkv5eqMEklZvX332iPClTkawnabyoiwhjIhClQrdIv6Bo
         Ncx7R+toIGS1dGlYMbWqCEiV5GoIXiuI9zyHppontvIweOjDYGLIVG47E+rcQxXFEQxO
         XdSq4K+Q+lQChzMg6EdpKyKIgDUaeWJkY38wD/76r2HfVBRMGaHrVwJVjmsEckV7qR1L
         WBpRfg96FopJyJVkWa7MOwHL9jB9C9H/L322keQtCbVWZFy/+4+2SOtOb9stt+tWDzG9
         VN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHWORK3KwN4HI1bZmPVm1g2VLjp1jxakUxrY1teMY0bicaT4u8vA5Dhgjs8oDAYC0BPNI1mYI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+h8T24gSJ09CXBPcQZTpl5gg0bGgQl1D5lZ5HA5Eg9NOV/lPV
	BUaz1fJH6qMEkBfoI2SO6s0jEx7jzqu+A4TJcXqdWd9mBkqrEFhcgrOWrXSVAkyvCCiINFsIvnr
	kqXmgWg7fJ6+5yC0aK21IB/6pTF+1Iuf1oyAhJURJodZOW5XL9n40DIqOYRhBeR+b
X-Gm-Gg: ASbGncsUEwrfRDZ+BO5zox0+gAe5m5kr7d043H9i4U6X1uIS5WnTQWq8lhS8dVHsO02
	bxA2XkraJC5OWdDtA45r3VkLKYEWU7wxIi2H4GTw1Tic5lnuIb4HPdahZWFl7O8Zahx8rtGumUm
	snmxXf2xwonK8Mxlx8AVg5dwChes1HCiQixLlwVZslFaslrWGZq4aN3dTWLBZ73eSe9tVpOxxRh
	Slgo7KunWi5cJHj9+RzLaLuLXYxiCSXK6+ebnzGp0FBQwEtv9Hmj9f3qVsgidhiR4KmcebtD/Y9
	QD29YKtAIybA+YLQ9/1TtMLKtOjp6s5zW83XLfpJqTb7xCjr2CxvWXs8ZVs76WTJj/DtoVnw5/o
	BK6FB3FZFXCDuqb7tFIbm/ZOYTFzCoR7E0T0=
X-Received: by 2002:a17:90b:5386:b0:32e:9281:7c7b with SMTP id 98e67ed59e1d1-33bcf85da05mr25992953a91.3.1761228214515;
        Thu, 23 Oct 2025 07:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnb09lMyHjX9OqhelwjDoLEOgHgOk+r/wUnfm+suG+1NvsV4vsi/W9hqLuhO6WQZAo8O1nAA==
X-Received: by 2002:a17:90b:5386:b0:32e:9281:7c7b with SMTP id 98e67ed59e1d1-33bcf85da05mr25992713a91.3.1761228212310;
        Thu, 23 Oct 2025 07:03:32 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3c1f8csm4250708a91.4.2025.10.23.07.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:03:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
References: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/4] wifi: ath11k: add support for Tx Power
 insertion
Message-Id: <176122821156.3033388.10937600819458906745.b4-ty@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 07:03:31 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX+mMlV06EbaWq
 XCFgm9RxFknV0U9Z26H+eXpDNWOKGDiw4m83jJ9abKsk9wiPjlMaPtNj/NaKG3nsqVmZ1h9FI83
 kt4zPupp+Ik3imlxGnIuOsnRjqYeQPIZcV6MG9JYIkN1YEOxLcoW26i+nXjfoCv8dZemA4Olg4S
 QpOFUTFrd9P9iWp1Oi5GQUAXuMpqYExxtw/738yciKWe8AnuEtv1gg+j10fU+im+IGkC9No+S06
 Ho4Ixwe6WnNafqWKEoO5uAdztp7ibMKP/m2WiocpmemRnfljY0iilEh5531nws6D/EFfRPoWVrx
 fCHVG+l18G7yUs1gtSgrrMR9J5BV5in5DlMWJcsqKtO3oxwOZHcKKTzjQdL318vc5JjDyGxrXSG
 IJgmFTJIFcsZhNUoZeTMSL9nbA9o8g==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fa35b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9jhMNZ7qWXdoG8tHMgQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: v-5hPT0OjNc1idoKqZ1A2PFkH6pyijTv
X-Proofpoint-ORIG-GUID: v-5hPT0OjNc1idoKqZ1A2PFkH6pyijTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_070338_416593_3045EB59 
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


On Fri, 17 Oct 2025 09:37:56 +0530, Aditya Kumar Singh wrote:
> For certain action frames like the TPC Report IE in the spectrum management
> TPC Report action frame, and in the Radio Measurement Link Measurement
> Report action frame there is a requirement to fill in the current
> and max Tx power of the device in the packet.
> 
> Add support to populate these fields in the relevant packets. Advertise
> this capability from the driver using the feature flag
> NL80211_FEATURE_TX_POWER_INSERTION.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath11k: relocate some Tx power related functions in mac.c
      commit: 66887282233d281cd9109dabfdad5d86b709acc0
[2/4] wifi: ath11k: wrap ath11k_mac_op_get_txpower() with lock-aware internal helper
      commit: c243d5e44f6ecbb29bf55b82e6dd92bca4fde0b1
[3/4] wifi: ath11k: add support for Tx Power insertion in RRM action frame
      commit: 722015690f52d046ae609e1b90cd3f018644d93d
[4/4] wifi: ath11k: advertise NL80211_FEATURE_TX_POWER_INSERTION
      commit: 998c68e96c03f10dec19b65279ade9d4000d1ae9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


