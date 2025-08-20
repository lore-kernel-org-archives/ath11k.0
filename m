Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9BBCA0EFC
	for <ath11k@archiver.kernel.org>; Wed, 20 Aug 2025 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRW9kchawj6P40fyxmcRiMMjqOd0SQuNWwNOjUiW/WA=; b=JmWMrr6R2RFyZi+sFZmxoq3laU
	JPWQcqH/reWQU7mFEHnWYN1Erm1nk0iK4WyD7JRCxcyUrQ2yhq0/6EEEiEMOBoch0XpNhYast+Jz0
	Bc/yOeyFPz1iNSd/czl1cjY5EGczS4dsNOPkNeDbUdfjSCKO7JQbmbSbcGQqXFz1fhAamOsZrKOIZ
	XxEDSL8QJFf9MdAb6+mIlxSdWPEdfb80tmxUqOJSP3s54Zn1wOjKjua2WEjbn6bQasrM/5TA8F0tN
	+3b8HvX5i34HZ1PP3T0zNdCG4O14Zl7g9Pdu96ljQAV4L9Ml0Kstj8u4VyGpIcoffiA0/8KEi6SUW
	tYWLUGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohmJ-0000000DXGR-4B5J;
	Wed, 20 Aug 2025 12:18:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog4P-0000000D9C9-1nIu
	for ath11k@lists.infradead.org;
	Wed, 20 Aug 2025 10:29:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA7Lqn011391
	for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 10:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fRW9kchawj6P40fyxmcRiMMjqOd0SQuNWwNOjUiW/WA=; b=Zhh5FXxw1TmeKj0p
	LnN6O16K5tjkZ5o0Z7Ciz9dXbkKLOShkYphl4lResk+t6T9Q4TIszyOXWO82MNlX
	HOnB7w2gfUlBO53c/38G1nCR/GRTNSTqqB6f9KVDuvzjuGQfpbYtfCV0OERDDE5e
	cXXiBRNa8yrP+9rpeq+g2hvPCRr5xUMecuzNwbouZijDRFniVsdOzaqjuw6lSSDQ
	FYOvbbEAPmU2oHGJVWZgh3MwmeOnHMhYOMxCuh2z+WdUNo/bClrhHX5PaACTZ8cd
	erhUm/ka3XIF7EhqzdLA5P1g2AjaVKbaKL4ewEmPy+1HSUYoZrwKeXeeIdrFQr0j
	1IoMAA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhd8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 10:29:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-324e4c3af5fso567606a91.3
        for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 03:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755685767; x=1756290567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRW9kchawj6P40fyxmcRiMMjqOd0SQuNWwNOjUiW/WA=;
        b=dYMFb2DEY1mL9qkTLmdiuLZIAsr/CsFzAzozjVPRdTP+T2D4ANSuEUkqtHElTvsvXJ
         jGjImJEsg4xLcrN3MRE/lVs9V3JKTNUO46HDLft99SqicY+cTPWx5MBNePy3K2sTndrN
         tTqnFQURGRqfkA8exlEIrwo/FIhPaTkkJ7K/TNG33eRXvh8oaaQ0oO/24M14/jibGEEv
         ioAhMLoZlAvKn4CnsqFgOjvRFI1p2nXdAVUurEsyhzSc+duk+Flz1XZ5cC2Ho0noqr+E
         nfqKYr7yU1Uqdl6PY952O/z8F68qeOqi2v9lRlxIi1OAVzYZ/f+6qQaATHuhQALgHa2M
         kN+w==
X-Forwarded-Encrypted: i=1; AJvYcCXS55iZkHwMgIq4EMvLvErMeEjr9Je+2PSh63unHsytBwdjVHHeyEi8Shn5lV60MHmlpnay0Tw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEVRSfvmVSIrfE4IpOjS6q3q/SQGpqlBdSufu5mLm/r0ezKhQn
	xEEL9SGjgUTqk+xmlhw3ztEh4nG/nGU0+sU4JmFtJfTIW/PbigH8XwcHgvycwOQ7i2CP5S7iWso
	+eY5cj9/xdaaGDKXm38Q2B07fHTARpS25S8N2dz+PPdadt7fQ3M9c5xE5aPXFXM0o
X-Gm-Gg: ASbGnctVm9c2lU5+6wvYk9QhOB00s2xtXerV3qV1iVtLqA0z5NpiMuChfcx6RpysvwO
	EsMkuoSEzmWfEoldM+shoZ9qDNcnpA5oubIIF5x/xtBqxKkqnzlpwnn4yXXt0xcG1uSK7E8I8jD
	6ebg3GFEMrv0Ncoz3ARyrmdKtGY9C7j1Ul/Dp78K56NrNcud9OAvuKEu6L4yejOakm413/4FNhg
	Tii19uDVlPkP79hfGuv8gRohTIdENcedmJDSkmlR6cExIjasmSZp1aZ6ZlKD9z63ErkVMzODBuS
	dHUSa9S7M5/HD8i7oOlGGeTGfJDqOYUj+z2mb6/XBVTEyOjxj+K1+CaXNpHWjDY7HBMG7o7QldW
	zjM0V94ewfGM=
X-Received: by 2002:a17:90b:5388:b0:31f:2101:849c with SMTP id 98e67ed59e1d1-324e12e2822mr3465717a91.12.1755685767115;
        Wed, 20 Aug 2025 03:29:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxdrz2WGofSLyKj6b5aAPoDJV8+XutugfRT6KDyoTu39P+ltuXKjvdVJTwEqnYbI19KzygBQ==
X-Received: by 2002:a17:90b:5388:b0:31f:2101:849c with SMTP id 98e67ed59e1d1-324e12e2822mr3465651a91.12.1755685766513;
        Wed, 20 Aug 2025 03:29:26 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.248.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e25532b1sm1932700a91.13.2025.08.20.03.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 03:29:26 -0700 (PDT)
Message-ID: <127cb2e9-5371-21fa-1f09-586e6770afcc@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 15:59:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
Content-Language: en-US
To: Balsam Chihi <balsam.chihi@moment.tech>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
 <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com>
 <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
 <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com>
 <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
 <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
 <69f3fef9-017d-86fa-8fbb-2ac2a1df8ae4@quicinc.com>
 <CAONkfw4cQktTqR6e3PGfVhGQPsqPctwjwLSPjdiAvm45tq5qEw@mail.gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <CAONkfw4cQktTqR6e3PGfVhGQPsqPctwjwLSPjdiAvm45tq5qEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5170XJwuzKxf
 SWQlkednE+qMBXaTsiS1eYu37PpiAUh1bYWrP58eqTTrR4mkyAamsZYy7m24hDbfuvjPtX/tqsu
 CIaeiCOcrhgiNiPNXFqjg4GQiwIJnTrfrq1CB/oOTHGUtUI+EUH4d8+4OHiQdVkCIqI2zuXAtzg
 T34ByQVK+Bm61E9MPzBuz3lli7YxRn2cRW8/rfGaT2yDZ4qkuTdmkUnwVejVkFkf8NFcCYIgY5u
 tns3je4AFS8awKJEy1m78YNSo+iAcu58AnWss/uNHW/us4KqGpSo7357n2jo+1ad3sz3YcrJBhO
 fbbo5/M7Eif+TxJXA23B1aQfeZ0wG+imYBwAlkRb8Zl125QhsN7DQ/MaoTAuv8R9QXiuT7MhO+U
 0Y1NS8uAe6Q+OHRVo9QpHuBOx0Qsug==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5a388 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=pagehsHO18wfKU6DcLw+7w==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=COk6AnOGAAAA:8 a=YwNWzT2bHXl3X7RLWIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: aVJmexbykxGQZnT1wZmg0Il1qmfdpFvp
X-Proofpoint-ORIG-GUID: aVJmexbykxGQZnT1wZmg0Il1qmfdpFvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_032929_474072_179C7CC2 
X-CRM114-Status: GOOD (  29.61  )
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



On 8/20/2025 2:03 PM, Balsam Chihi wrote:
> On Wed, Aug 20, 2025 at 10:03 AM Vasanthakumar Thiagarajan
> <quic_vthiagar@quicinc.com> wrote:
>>
>>
>>
>> On 8/19/2025 2:20 PM, Balsam Chihi wrote:
>>> Hello,
>>> I Have a question on the same subject but not related to the bug.
>>> I have many identical PCIe WiFi cards on the system and I need to load
>>> a different board-2.bin on each one (1 adapter per frequency band).
>>
>> So you are using multiple pcie devices at the same time in a system
>> with ath11k? Wondering if you are using any private patches to address
>> QRTR instance id clash issue [1][2].
>>
> 
> I'm not aware of any issue of QRTR instance id clash.

Then better take [1] for proper functioning with multiple pcie devices.
The other one requires a new firmware feature flag.

> 
>>> Is there any kernel built-in solution for that?
>>> I could not find any, so I had to create a patch that loads a
>>> different board-2.bin for each card based on the pci device address.
>>
>> Current board data selection for QCN from board-2.bin is based on pci+chip-id+board-id
>> combination, not based on pci device address. You can find the chip-id and board-id in the
>> debug during QMI boot stage. Then you can use ath11k-bdencoder [3] to encode those
>> board data binaries into board-2.bin. This way you can package all the needed board
>> specific binaries for a hardware into a single board-2.bin. Ath11k board data file
>> load logic uses chip-id and board-id to download the right board data for the given
>> hardware variant.
> 
> I have multiple PCIe WiFi adapters based on QCN9074 from different
> manufacturers.
> The problem is that I could not distinguish between them at the system level.
> All have 0xFF as board ID.

Hmmm, ideally it should have a valid board-id other than 0xff.

> So, when loading the default board-2.bin they behave the same way.
> When I contacted the manufacturers they sent me board-2.bin for each
> configuration :
> 2x2, 4x4, 2.4Ghz, 5GHz... (maybe calibration data and more?)
> The default board-2.bin for board ID 0xFF does not support all bands.
> My requirement is to have 2.4Ghz band on slot 1 and 5Ghz band on slot 2.

I can not think of the cleaner solution when board-id is not programmed.
If you can make changes to ath11k driver and your system has device-tree,
may be you can add a hack to pass board-id/chip-id through dt (new dt properties)
to driver. In any case, you need to encode all your board data binaries into
one board-2.bin to enable auto download of the right board data into firmware.

> So the patch reads from rootfs a text file named with the pci device address,
> the path to the custom board-2.bin.
> 
> P.S. : qca-swiss-army-knife did not succeed in decoding the custom
> board-2.bin files.

I that encoded binary with TLV for each board data or it is board data
binary itself. You can run ath11k-bdencoder -i <board-2.bin> to
get the information about the board-2.bin. You can use ath11k-bdencoder -e <board-2.bin>
to extract the board binaries and json used to package the board-2.bin


Vasanth

>>
>> [1] https://patchwork.kernel.org/project/linux-wireless/list/?series=692423&state=*&order=date
>> [2] https://lore.kernel.org/all/20230111170033.32454-1-kvalo@kernel.org/
>> [3]
>> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath11k/ath11k-bdencoder
> 

