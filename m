Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E026DFCC9A2
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=; b=piF7Wk9kAcjw2f/osn29RJIzdy
	7IrWy7L0ci07UjLDJsQKrBIMH2SmlK0ou4JfRzPvzO/Enl1kTlinYmHZIyfp1rJuy8KR1re/J/PzU
	UUlcV5m87WFbw8vh/57B9REfUeUU5iip4ltFbhFQPuvOwHtOdpyiBNvoybXfCrdBeltTn9B3IUHzd
	4hLMC5Fp859vCCNIkaD4ORUXnsNyKyg2lqDw5K3NT57XCi/9+nqGOtlFAqfoW5ULMCTsSmvja1LeQ
	30/iUXZmXeYB71Zfo1pUBiEN/QVfbj8L9h9k9r7yJnFyNpw0Plh1oqht7lro/W73RiMtKe751E4zr
	lk+nk+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkhE-00000008OZm-2AK1;
	Tue, 10 Mar 2026 00:11:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkhB-00000008OZP-3rv1
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:11:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JFpNH2872752
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pkr/1ETbWQejqwBM4qtLfTAa
	AxiiLLi9EmI3z7gEzag=; b=WqxwLbmWApf+MP0scmsGweu9kRuuQzlAxKa4xDS0
	me8bCEsYRkKs0UqWwp4R59vPcDuVB+sUvSjJYiktF0Pg+GoksF/Yb9wLMbKTsSy6
	eEvNwkXDKNb2s5O8Q9n7PJaB1PwXlA41ErXyFErlqYexgIloTKVfQBgaWmjJG5qY
	vZkjvoz4Gc9Hw2a0R2lMbYCxaWXF0jiwiNDghAdbIFS/l/57J33Cfq5PJC0QFLDz
	V83A0oMU9E0jnBSSPOM7pcI20Df55lyB4rTvvcc/Le0Q7hATER62nsGQGoDz1Ql6
	a6NqXFKxHRyQRVayozXJPrejWDjiCtYw3AzN/Slg69jV0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477grem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:11:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd767c51efso326141285a.2
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101492; x=1773706292; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=TN0vou4aWqLcH7GfPXZt7XMbLB2mVqCWMXqW5JkiCDuoUzgxbxNe/kieTS/EqpFfFA
         7VYvqmD1JS1uNL8uEloA0oNcyS2VmhJa+ongPZU2BUTReG5xHA7HYpzdFs/6G1r/ILNa
         n/Mdw6z6VVY/YFpOiYrV5hXzYMaA3yubQUhPSHum/mWdPpgRquQaz5y//eqGQNLzsoFZ
         9tCA0OCPBSvr6oAu1iHMSI8V1HIlJPxkR1w2zagMTdPxSGI3DNZwLSpC+VkbWZqf65Hf
         AhKglIt+CiWixHoSsQbnAncYFCo+tv+iAM4q37kD4/ED9+GJ81NLZZeLVWpS8G6rF8qE
         uoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101492; x=1773706292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=MG0jysNS5rlrxdYqELPhCzY/cY/zhCc+mIwsqIaEToyYje5FLG2wx0MGnuHwy3wh1x
         VEKzAvPRX5zHZGjjX2RLFjZdQ283RwVw2SKJy2MhxL9FNtO2g3QTltrtCvc5Uf1qyd0V
         uUDql9z8Lp7O6dgedWY/NdP9D5Vb1yFy8r+2Jq6Rs92kqtJ8UPTVgaxc42qSV7imGYNw
         9DytdWxZvZQfwvmSsd/x7hSe+ds7WPR5MgBHwx9tppkb11BarzKj6NI+l7SZNLM/J72V
         BdBOFdNizmGTdPAKZTYv8QV7rR+dJj2iDD9CMrey2kH77399Pqy+5sChVsYamQcsQP0p
         6RnA==
X-Forwarded-Encrypted: i=1; AJvYcCWZa0cyj60AmVRfjYOCtnAk5jj2kGYbW381l2+K3R2+VviPJqbY0yTdtighqwJF80Y/tZwF3CA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh3jZBlHrZCPI8uTd3mYlQL2NLmqmvN8zlk36UKVbAsiv5EFDS
	MoiN5Lo5y69/tiBmkaQAIXlPt79B/NzpoyZnkr+rSAesTT8xFz7jAepRgZFsLlsnrauwnHzXSmF
	LZ+3A4XNRyTaMLWJ6nQGVO9vd3LOIihGNikisCmK9bdSC1y+bBlIghs9TRQ2OiTXl
X-Gm-Gg: ATEYQzwRuIVPDLHJZsLDoUCbzyeSKKTPcl+XTc9F+P4KKhd6Bsy8w/QrzvqKx1ti+Pq
	kuI7zc0g3mW0VyNUtxKWMsNiSy6PxL6snX3fnZaAW4n9EwAOC9Bwb+B6kIxyyv7lWv/nBem6T9j
	kPG2uNilNd8KXBAbNm+tBw+RYfo3WvlJQwGsZvDyAA9auGFru/wPi/T/OUAFLZY+ikHaABoxRpb
	gMttEfGOkDkPyBTtF9D/R1IJaozc3us02RMFIWK1SGwp7hnWIbKCRhJMOj7yIyXNVdhqJ/y4/7O
	FIO1vhh2uvJA4hHnFeEJ14/cO7F+kKVkGVRnwxynmZIk5l9yYUKCXhGQ2HgLezuoqEeHqVvtExQ
	PsdxURWogOpZ/2rV25sW1COSMQeztK9hV/J7fCoB7kvVUkS5lp9o/5TT1ccXY+QgBMZmERDpay+
	NZxenbqmbKg9yASEXatK0+sgFZcbS59V/bOmg=
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698513085a.20.1773101492202;
        Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698510485a.20.1773101491691;
        Mon, 09 Mar 2026 17:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfcb1d5sm1692581fa.16.2026.03.09.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:11:29 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Message-ID: <ce5hwbo75dr4e7tt27bcprhpch6fx47omhn22ni6v3uzwfb2f2@fa2bebk7foct>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX7Ly2R6CKTSJI
 Z9fY2yabfpoW056Im3eG08FxsC6feZbK7+6TMvgPzWD80IfKvtpH3TiQUPQkg1YJp2rg9nU9HTp
 AMDiKIYUSVh4SX7IprITAPlS7SoWmS/OhXl38PbQvEPwwYA9i/fo77IMe5TOj2Ld8whSgjgxrhc
 /v8pxg2TbsXTISANk77nWlKdRsbRvvHis8ourl7P1cixTepG3Q+k5qKfFaMYfFiwCuY6SaCh8fB
 rtY/SwpwGhFCQIKxDlkved0o9OLTnRr9OQTmUJrqHb9CsTXgfw/uLgKLET4B7f47tUYqy6e2xgN
 zJPmp/jslyFTSQRMHBWx5lNBQle57UCmu2rvuRKXEWpwJPRjnwWTIY3LwV54dLJS2ar5MreGJET
 v7NmAUDCQnzCxaxLcTTnczsPQRqFh6p8JqyhqRZbFN6MXSpo/m84qlSbicqR/XHyJ9ApUXQhwrl
 Vy2tpQk/UUbw/eKj7FA==
X-Proofpoint-GUID: QUwPhCGbm6WIqIoIasY2GIgqieuz1UXY
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af61b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pNJNIoqo8oUBudG6fy8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QUwPhCGbm6WIqIoIasY2GIgqieuz1UXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_171134_082002_66D73CE7 
X-CRM114-Status: GOOD (  17.47  )
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

On Tue, Mar 10, 2026 at 12:03:29AM +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> It makes more sense to unify their names and move the definitions in
> the QMI header file providing a consistent way to represent the
> supported protocols. Consequently the different drivers will use them
> instead of their own definition of the service id.

Also this looks like a first step towards providing qrtr service debugfs
in the kernel.

> 

-- 
With best wishes
Dmitry

