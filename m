Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AF0CCD19A
	for <ath11k@archiver.kernel.org>; Tue, 18 Nov 2025 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX+0M+0mWy/BPLyBS36f3e9yT2ekaLn5n3Ig+Sg3x3Y=; b=NtDtFG0XCyWWwV2nlrmSNWJnxA
	7risTD9OMN7VWBP0xHk51C3jdnaJnzFT+enPl26ANkaJ2S5nvKD6yM1ZqAawPXSGcbvF7uYFilgMw
	ovXdOtCLWwoq6OOmX7fjcn23tAWM9TcCZbRzXG3ez+ZuhnRx8egLISO01irezD7Rkd1GBJ9QThfWs
	umG6QeDqGGGq57m93BSE79ZjVdzETvKJ/JrT+3TZRsZKFHgoxZqJWEsFl+GDzEE8F/af0KYxNCdU+
	L/5h2Lg6dl5Mr1swiY94TEYAofpFHD23VArcUVBAWjyPF97LCzmxPhiJ7dAi/3WOjWOw3iwuPqk9G
	d1s1oxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFar-0000000HW1h-173m;
	Tue, 18 Nov 2025 06:53:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFao-0000000HW0g-2vnP
	for ath11k@lists.infradead.org;
	Tue, 18 Nov 2025 06:53:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fRdb2343395
	for <ath11k@lists.infradead.org>; Tue, 18 Nov 2025 06:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DX+0M+0mWy/BPLyBS36f3e9yT2ekaLn5n3Ig+Sg3x3Y=; b=htY29goY3toDJbWU
	0z5wnuM+bTc6MZbOrVPEAW6XsBSUOHMS9nOr4D7Tl5kBIk/Q87p2UhE1xsRJuxLM
	OPdnWbnxes4VxBSz86UlyCN8VZHbtUAUQqfBYjaZG84XAwn1pCRiYx/2WcBOF5Iz
	X57R4jlyleztfKlQYesTgnuIjkJ/nhM8AobhyneA4Y5sHbgdIAM5MhTmYc3dmYw/
	6ZpJxfgnbUHK5lka6SBuCD32TJcK1K8m8V9iQL85JJSR9jk9oGV37Bkq4/Z35knE
	mjRRu6f2rkKslgON7L1chth/Pjpvtwjf6wIKzCMMOyC03rJlfVdG98j5efcKzXnM
	jRtsFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn0105-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 18 Nov 2025 06:53:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f587dc2eso93263675ad.2
        for <ath11k@lists.infradead.org>; Mon, 17 Nov 2025 22:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763448812; x=1764053612; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DX+0M+0mWy/BPLyBS36f3e9yT2ekaLn5n3Ig+Sg3x3Y=;
        b=BGKGseiKSkOpasrLsDyQVkGRHDFBBCz0AV4lK00rLiHHcN92tECNOkXRM0ONMc7xyN
         VAjrRbD3pPn+xJXdI852qxPist5OkP+fq5cxpoNHhizfDVXRu7aUMBgVx0ADnqOLvldQ
         4YG2ZhYoe3UOPWNS4EQXjxR0JWNsx21IAUpW4SeyOc9xbpMtAfoEpyi856nXjWjFli21
         lLtLSeRDZLPPPoWwQWzxwdoXIOaU5yu/rGmIFZ/0WVuIRwWp11/BzOtlo6oJOR4gKokj
         YxW37esbtGeC85OWe1KpD4SNiEQF7bOzqqnySd+NtoFSrxeci5xl9JJEgNx23DyUOQqB
         WbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763448812; x=1764053612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DX+0M+0mWy/BPLyBS36f3e9yT2ekaLn5n3Ig+Sg3x3Y=;
        b=HpmLSE+TnMggD6N354hHP672Um+3YdnoiK8lJ1XPHioZYEywLyz6MpqwTX33ttYqBm
         ajwkXChrW1OX4yXh4A7f45zQZmm9oZ68UAyeDPj6VYERbflJaxulhIwtVPu+TIXkAFRB
         De4Kc903Vk+An8ujO93XFHMnS4dIFUNKYxvivQXRG+E31AOvbNAGKvBKMj/+2pzETNPc
         qbtMCkEu5lyAtQLlOLBGQdkkzbGtSwXvTAXFgZsdJyz3rVodRz9tBs5/7SZIPxU4el4U
         uSgTqtCYMpkkEfgwnyx1Lu+xZBjFCpF8STzHeljzZhA9EoEQyJfgQQlJH+Mf+NYbCR+4
         5d5g==
X-Forwarded-Encrypted: i=1; AJvYcCXpi6kqby+vfZ/iZ9ipJWsio3WRapsG323rHcU2FEAdsJFpxGtsn7MdA9NRa+5YebctmfV29rY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwJyWiWXnX5JcnxOCwpyTJloQqY+ywSCnJzJWdyvCZwIMW/xPh
	bVoyS/TB3Z5nSoTPs7PLuzVrHP0CACxNcbgA257BBVlS3MyBszTAU81wXb/adYXCbg2zKn+pCHo
	zgh374BoWnFOTjBUkDvT9BKQa45HIbBW8bKvb1aDiIVP8l4cQi1qfrp9CSfPxgy+i
X-Gm-Gg: ASbGncsPrg3LOA11Bgoq9xSCwqfr32+V8pWMHprh9YYy+Zf5L0oIbOhn+Cm1NcL/BsL
	ZQMwAH7b4ERi03gpzjH9blxMmriWVD0ZMGVVTmN2+Q+FayHz7XYVUdd6sAONXgM1Af9TuQ1HjCv
	oqiVzhi9/agKvG2d24frlamsB528IeMe5nDXxi9KxlnblqQTnHNoaeAlOZGIQkelOcCOIkLpNLU
	H5IgJmb09FZd/KtzDrTRHbYljdV20dt30TMi/fSSK0OdZVjtc+e7uPiEyK6HtcIrrowU0GKlCRf
	FDRaYeDvV/Y2y3vwj3xyO96mShbq9c21qVE5wu4nsEkuQdrRaXd6ZU5Ebh5BOYjxOhGmN41kAhh
	42hUn7ZpBe/mHBA==
X-Received: by 2002:a17:902:e84c:b0:297:ebb2:f4a1 with SMTP id d9443c01a7336-2986a73bb6amr162660765ad.38.1763448811923;
        Mon, 17 Nov 2025 22:53:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwLzQEHhETj6zRkHw+TFy4NsmE2cQhY/5PkFmJnlUFOaaGzYA6d6q2qBji1rRTv2fZXXmQCQ==
X-Received: by 2002:a17:902:e84c:b0:297:ebb2:f4a1 with SMTP id d9443c01a7336-2986a73bb6amr162660405ad.38.1763448811396;
        Mon, 17 Nov 2025 22:53:31 -0800 (PST)
Received: from work ([120.60.70.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245da0sm160489625ad.26.2025.11.17.22.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 22:53:30 -0800 (PST)
Date: Tue, 18 Nov 2025 12:23:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
 <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
X-Proofpoint-GUID: 96lzlM2Dug3HX-d7JQ0d9Mdjg8nxpTuV
X-Proofpoint-ORIG-GUID: 96lzlM2Dug3HX-d7JQ0d9Mdjg8nxpTuV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1MyBTYWx0ZWRfX2ythAO/QaiWl
 FMKHPmf0e/HZ7k7eBXgiMXj7pxR2x8WaSmx9IZ+Nt3MoFJbiIlbtH2thoRgPuC9g55w+rF/2/m1
 Mi0IEb1IX1zJE6BPoy6Lop6hVYKhK5RhNsljZxUc5xDVIo3fCPwQVQ2ZbebYXvWq4fAmTqEgCsB
 W4EIWuVtoNn/aS/qp8+ilz28JbwF5AyDuOENdJHRy254SbPZHnEz0nwFln5DknStSI/QY9sh2o1
 t8P8vkhy0n2AWHM67Mb10i4aaKrJO6sX6D6nJO62WU1XmsYMmfCjEztsqk/OkEqdJmcLvGpziE7
 0f1EeItjb5rhexZOiMxCG5Hb+UeO75PEnwwo91L7Rx3/TzL7eydnxqzbdHR7EnPt/j0XiBC3pLX
 PvUpnEsmlGx3f/i/6YM8I7qPKkDlNA==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c17ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=0K+2RuW+WQ0nQqINzVEGqg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XiUpprS5y50ibpukT4MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_225334_883162_056F23A7 
X-CRM114-Status: GOOD (  36.59  )
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

On Mon, Nov 17, 2025 at 09:13:04AM -0800, Jeff Johnson wrote:
> On 11/17/2025 4:45 AM, Manivannan Sadhasivam wrote:
> > On Mon, Nov 17, 2025 at 05:40:06PM +0800, Baochen Qiang wrote:
> >> On 11/17/2025 5:00 PM, Manivannan Sadhasivam wrote:
> >>> On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
> >>>> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
> >>>>> Hi,
> >>>>>
> >>>>> This series aims to deprecate the usage of "qcom,*calibration-variant"
> >>>>> devicetree property to select the calibration variant for the WLAN devices. This
> >>>>> is necessary for WLAN devices connected using PCI bus, as hardcoding the device
> >>>>> specific information in PCI devicetree node causes the node to be updated every
> >>>>> time when a new device variant is attached to the PCI slot. This approach is not
> >>>>> scalable and causes bad user experience.
> >>>>
> >>>> I am not very clear about the problem here: is calibration variant device/module specific,
> >>>> or platform specific? If it is module specific, why the lookup is based on the machine
> >>>> 'model' property? While if it is platform specific, why do we need to update devicetree
> >>>> node whenever a new device is attached?
> >>>>
> >>>
> >>> I think I mixed the usecase of the 'firmware-name' property in the above
> >>> description.
> >>>
> >>> But nevertheless, the calibration info platform specific, and hardcoding the DT
> >>> property fixes the location of the WLAN card with a specific slot. For instance,
> >>> if the board has a couple of M.2 slots, users should be free to plug the WLAN in
> >>> any slot, not just a single slot where the property was defined in DT.
> >>>
> >>> Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
> >>> property is irrelevant/wrong.
> >>>
> >>> PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
> >>> expect it to work.
> >>>
> >>
> >> correct
> >>
> >>> However, as I learned from Jeff, calibration variant property is also going to
> >>> be required in cases like router boards where each slot is dedicated to a fixed
> >>> band and the calibration variant is going to be different for each band for the
> >>> platform. So unlike I thought, this DT property cannot be deprecated. But going
> >>> forward, I'd like it to be used only in these special usecases. Most of the
> >>> upstream DTS have a single calibration variant for the platform and for those
> >>> generic usecases, this static table should be used.
> >>
> >> If that property is not going to be deprecated, should it take precedence?
> >>
> > 
> > If you mean 'it' by this static table, yes, it is going to take precedence as it
> > should cover the generic usecases. For special cases like the multi-band
> > routers, existing DT node fallback will cover.
> Does there need to be a PCI Vendor ID & Device ID as part of this lookup?
> 

I don't think so.

> For example, start with a device that has an ath11k chipset with calibration
> data for that chipset. If the end user replaces that chipset with an ath12k
> chipset then with the current proposal the same calibration variant will
> attempt to be used. But there will not be any calibration data with that
> variant for that chipset.
> 

ath12k doesn't seem to require a calibration variant. But even if the user
replaces ath11k chipset with ath10k one, the calibration variant should be the
same as it is platform specific except for WSI.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

