Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DD1CA0EF5
	for <ath11k@archiver.kernel.org>; Tue, 19 Aug 2025 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtXWbngOPGt6DuVhyjlgeokh/NaNiJ8+cTcMhEttiH8=; b=G9hKTkHHFNm+VruX01BQga6lgm
	lKRZkL3IBBe9cnC8WG7Rc5iW0WjR/goddkdCR48GxL1Fz6MbrmOUtWrUJMsSZwFKcDSw+NxBI5C7b
	5ssKQOzomoAslMART24LyRbmE8dBzT2NH7pj5kPy+jKizwx7aQqemqQweMcTcp5i9pyAPg1Nil3Yn
	7kA21BHVV+/4GIjpQKm1IC8naeQqh1vN47pdETYlQ25O6PDb6+UUU4pq1zGM1rVDCbFHOUJcGNvcZ
	Rw4CAYM3KIIMX2hDPLPZUUF3SkV3coBrcpADD8sQu8KjQ8g7ZIWWvweWfMDJmyKxKslN68RfLm6AN
	+1X0nzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIdw-00000009xc1-2Zsx;
	Tue, 19 Aug 2025 09:28:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIBb-00000009s9y-1Pix
	for ath11k@lists.infradead.org;
	Tue, 19 Aug 2025 08:59:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J8pCJP011141
	for <ath11k@lists.infradead.org>; Tue, 19 Aug 2025 08:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtXWbngOPGt6DuVhyjlgeokh/NaNiJ8+cTcMhEttiH8=; b=GrZdQhkFdRPRAKMk
	UC7rUFlAeFl0FZESpJAI3cfKhZmxu8p3X/3kVikNRqQyWLAJKI0jfB3Ovr9FyWr9
	wD5ay6W6iTZFOymIMgZRAWUBbBNu72sd1fWNjaEVDYfTTNCGfusnjvcYpnO4pztY
	7UVfGHxkC4SziF8UrhDsXHV0Up+fU62LAPZTradzAu2Di7WhaDHhKC3lUM8LFuew
	hkOQN6YOfc1LKU7/Pb/J8aKY+qUCUM1G8G+HNLMIxyHZc6lXBSlY0hYKrYgANaRp
	V5WipSheyxSU/5ndvscd7gFDl81fGXXb57jbHfYFJkMOmey84dL5Feb1ubd/6tFY
	GTtpiA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagytuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 19 Aug 2025 08:59:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2ebafe0aso4312402b3a.3
        for <ath11k@lists.infradead.org>; Tue, 19 Aug 2025 01:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755593957; x=1756198757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtXWbngOPGt6DuVhyjlgeokh/NaNiJ8+cTcMhEttiH8=;
        b=W3BBJGFoqSKKhpyVTs8uOOB4Rtz213hTNJI7i23dFmwTgPtaFEbl8VJCjSsZNSQ79v
         4m3LjOmvjefW4Gx/+ygZbIKxmvx+q3UqefulNkBokfAnHrH24T1/ytXjkI1tj9dEp7EJ
         kp8Vk81nHWKfQnVpqle2kjOAx76pcrWvJG3LLutW4SkNKJEIZlL0SxMa0+LRjP1pub1Z
         Lre+5+SHudoFZt3eO04nSBOMI3HKsl63WWmysfeVIz1kk+AqDIqJy3ennep0fbsvtbAh
         1Q8hK3ARIjpl5DMYDF9JasISGCjp/0e1mxZPysRuGJm290z+OmmOv3YkC+B4tXDZ9fLF
         /4qw==
X-Forwarded-Encrypted: i=1; AJvYcCWG1oIU8DPu2WTOgnnfoWa1V9XcWsVcJIcUyJdM2F4rarmxZ3v0uPNkicH2aEr6zIlsWZYUfsc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/JaLmrLXM9l8ZOBcpW8QgV/w69gvTtTbdrUO/0cOh9F7gkqgs
	Kspob+pmN4hIk2Hpmzg0X7d2IgB/+UvOYQzqHFR1oDbvj/hyVJATNlMO/2Ifspim8QZIn4NiGnG
	WeN6IYbfcOP1s+zNSbDxmvJammerKXUifEOm19e4KmsD+PnzH1FE3C5m6qCYOiDV0
X-Gm-Gg: ASbGncv2kCMoFWjYGXweDq3OdSYYtvOOQ4dI6Koj9AeU0r+Lavku6cDWBpCHFWHfJCP
	mJBn9/Nh4Pq6wfiERGtqcL3SFOiEUC3jm5PEHRU0GnzIH3K4avHN4ULPp9gmkVj7ujXRkApRpSx
	ZPsJvfWkiRIKOReKSkvO14HqmTkTCWn47ZSgXxHYNdueHdM5joDf4MJ6M7CTPlqp+xW4Sl4BCcF
	EsAN1W+JKVhNj9TfZczQXYAMGEjpxh3Zuubg9zgastTKmUQrJ0zbm+YXhXfgFsB9alEPDN28N8g
	mFsmRbSA4rqbILGPnjUAByUVhxvwL8f7u3A+lkscc4JlYDv5SG+4ayEEm1xXMSDFQYZ4mrffPih
	qkf9mPF9H9kKyiR57SXNQNxEgmjz82n9MXBon
X-Received: by 2002:a05:6a00:178c:b0:76b:dee5:9af4 with SMTP id d2e1a72fcca58-76e81140267mr2183296b3a.13.1755593956990;
        Tue, 19 Aug 2025 01:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO7sRbH7cezJOI47T+oxcZtTuI3MjOHvoF0FadK7AtZgpwLcezuh5FE3fQ50kc9WYgXTNmzA==
X-Received: by 2002:a05:6a00:178c:b0:76b:dee5:9af4 with SMTP id d2e1a72fcca58-76e81140267mr2183248b3a.13.1755593956523;
        Tue, 19 Aug 2025 01:59:16 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d3a82sm1943347b3a.6.2025.08.19.01.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 01:59:16 -0700 (PDT)
Message-ID: <096a0450-0d77-4c46-a7d9-4bc002724d77@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 16:59:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: Balsam Chihi <balsam.chihi@moment.tech>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org,
        "Vasanthakumar Thiagarajan (QUIC)" <quic_vthiagar@quicinc.com>
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
 <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com>
 <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
 <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com>
 <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
 <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a43ce6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=16gmyrRBeBkEDI0Ud1IA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: ORXPnuBReQr8VIoM6kIQ5O_pPnhuHvav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfXwiW7CNf8eabF
 CTJrmwWMXZxCzyE82wUBRBQoQemLHv8voicn8moZ4zQhoc5q4J/PpUMLgNKwNZFpzF4o9qFwB/6
 X8+JJ0N9S4uUahf/Lnsw1PVUc/LF1DoCjMIwhS/ytzRLrT5ktMKaQzHsjEsJsDkNYMTYcXLlFeQ
 cLNYIg2RcPZnCs8cYuCH5YbbrP8y/G0B+ayngA8Y2YoCVfp0mCFp5Q6JW/LzlY2PwdbOP0SAIGI
 2uRAyGpdBnNIHtpUeRkK7I6AcEOfyRn04uSKYMo2qE6ExFljU9i0IYkBZqtD5J4YM7KG0+MMvW5
 DlmgZopHxt6Df+pASwOxNqGV8D08YJ80Rf5Jx2fAEefM4KjGqs1eyE80buxY3vWhAhqx/mdoVRo
 N8/hLPrX
X-Proofpoint-GUID: ORXPnuBReQr8VIoM6kIQ5O_pPnhuHvav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_015919_526346_140F4D03 
X-CRM114-Status: GOOD (  19.90  )
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



On 8/19/2025 4:50 PM, Balsam Chihi wrote:
> Hello,
> I Have a question on the same subject but not related to the bug.
> I have many identical PCIe WiFi cards on the system and I need to load
> a different board-2.bin on each one (1 adapter per frequency band).
> Is there any kernel built-in solution for that?
> I could not find any, so I had to create a patch that loads a
> different board-2.bin for each card based on the pci device address.
> I patched ath11k's core.c file so that it reads a string from a text
> file in the rootfs (board-2.bin path per wifi card).
> If the text file is not found, the driver loads the default file
> provided by linux-firmware for all cards, the original behaviour.
> Please let me know if there is a better solution for that.
> Best regards.
> Balsam

Vasanth, can you comment?


