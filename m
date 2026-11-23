Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCEC606A31F
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UVlf/wJF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCnav1/I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=; b=UVlf/wJFrsammH
	41nEIbd8UjIo8iGXmUDpTh04yn/FgF2g27iItz7lb8+/vcDqfkPfghA/mLykHkb4R1cENanblrjI3
	K6PvfBNUxx72hqYmVHezVqbgfsMMpJg5QZm+5pegAChuuIqQqcwyiKoUzWIoqImomkN0VKorjEyWv
	lpL0IKaSIHUTfLNBkrjTDcejtnVIOhPkxSWIdUUxUUenhqE/2J9MXBUvoDf1dwY3gL9FK84pZtI6s
	cWKz4/ZWXr6VTt7ydqoC2QHJqSyYeZ/4uyougFPapsw7Bm61SfiOZaAQABOktUeKnixPyGM+WH+CR
	BNYop1Ii+ZAqtz/+6FLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW1m-00000003zy8-0y5L;
	Mon, 23 Nov 2026 15:32:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW1j-00000003zwr-3OBm
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 15:32:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKtsl3329289
	for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=; b=XNi3fIG8bLeWMU+f
	PwdUtzFy62pJN3m/uGsa6NfdR7ouMm5LiYtfaTNBKNdEfLs2s6R1cStk/RtofF4x
	SxsjBrl8EMJQUyf9IbdVp1Kkf3Ov/9iMVU+qYILRHQ80s/FTqKbeAsCdcCIifPYm
	qQguOivaL4NEWgFe/ZZDj9CPwEVNJVVlZIKbYGV5HOdLSWGOnNn4ayu09OWHKM5A
	pLK2Rue2VTs11R8os2eWmHiavQxvSD1MSHOLPNMkcUdndOq3w/AVWm/RhpR3RtwE
	1hpChhkUrek4n3LkgToNrUj3GFMofKy2/YGBck3DD8J/sT2qDTMkRM36+YjhmM+J
	t2o3Vg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd23vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 15:32:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c58d35c0aso466282eec.0
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 07:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447939; x=1796052739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=KCnav1/I3MwJHHj7P5KnKCaI3ubnIlYWm7oQvkDZfgk0Rw1YQjrip4/UZhCBjOlRlw
         ifOA+E0kJGEI/kzODVjqVTfkH5/B3uCl0rwjau0mL4ua9XJ5ptGpMozUDbXBvT48+hC0
         ZOoGOv/OFtMhYiJn7LYR81eUvXY/e9bCZlO01hHN2K2JgSR4op2YFNfk0Wusw/M+xLMC
         RAg4bBW3jQV6f6+fwNSsdv/Z/BvMr2STmyIRtHOJ3hc3JLcjB7aoyRSsRQN8GeXOOjN4
         eSIhjHzUp4DipGYqQKJBibIt2EIlfEToJKGxzYNe15CCwLjTwFid3TIl8ERAe4wSZv/T
         YvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447939; x=1796052739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=ERzGGQTA9pl1orUZ05EtbcaMmehQop1kI2G5pZBgnKMq2wjS+RF6NY6wnM+blf2P+i
         1EvWXlB71FRhW3NA8Z34+kuzz5/qwPicND6K1k8PiCxN7PHScXbtBO1uIEDPkQf0jnRp
         0MbwQWGHasNEdPZ6ZEB/2iU/tEdS7qECJo1HP7QDw765CSXR2R7w8QX5Ru37b7jQSVF9
         XRia5pvqkMf81V9mGyJmnJ5+q7I/DEJKifhZoSJLaom6rtA+XYSrbCRJwsA5d9yc0+Og
         BQKJfBv28VipsJr630h1bUckMc6YXHj9k3uuGNkTcmvOO9nxNhAOaN/hPjJ16CDVtooN
         g4Pg==
X-Forwarded-Encrypted: i=1; AL+hErGOoxr878v/WSVrzM2t+2/QnGBgPvWGjNeBGvqZy/73Q0ibUEgCZnn0RfqbhZ+F4Lw8TpFswK4=@lists.infradead.org
X-Gm-Message-State: APuU4Z83pNL39uF9MD7sc7midfuENUPOQ+HOEjeJ5Wc+WHXoBdr+9c7l
	PATf4HKW9z7A1MIaqLzTAld4DLma14Sg6DT5S2DslNMGa5D8ZnIiKRJEYD3Gmg4MI502DQKOjDQ
	ARkkAUuxfPg1MVWOg2Cvo0YnQoWPXMw8dwrC8Dshch2bq9tWZQ0Z4pbhCKJ70baIr
X-Gm-Gg: AZFdTZeN1o4HGhZcURjtNP3tS88qn3fV262pTr5hGATVSK+cwEHmm85XYrP/fw0oKS5
	vKwjibxKvW9sAStISrWQ5KNsYOlns4OTNFOC6yvGR/3+ErCs1hrmk2NAnYTssG3G8/kXO9tzQ/U
	TfkhOucZu8ilCKVZr1lrk+tLhfuD+UbuweeBgkO5vP7uVXBET0yUYG32XvDgFBg0g6LsZqt+1sS
	G7cDO26UA/CbzKZBVqUJsByA8zdJxwwqaYppFR3weFgJ6DSag9ZFX4m9qheRrSly+su0eura3Gy
	2sNyS2XHK6FIHPMc6ytIJJvsOPPqpNScnlZpWkaAdY4kvJE8wo0TUhE79spMuKN85nizIJNvH0i
	+8lIOTNV5uei97gzNKYSLhCLK/yYBfjged/79wOl4wi7VGykVIujsOoaCX0RrrEhDTEf7TkY=
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458770eec.0.1795447938600;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458731eec.0.1795447938084;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm5516406a12.9.2026.11.23.07.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:32:17 -0800 (PST)
Message-ID: <b777e26d-98a1-4cef-96f6-cdab7918a1cc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:32:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] wifi: ath12k: Add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
 <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tyTx9HcCkmRrsCYoUxb0FRtVFADdM7F-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX51Il9Zy167hQ
 DjpMtnZdXl5n+7pgWbmYAhzzRH0UpJVvjlGMTnjtWaKzLl2p1Lag+0+1OT37w2X6aqtDhgoXPaS
 dkWCsO+f1+Kb0nI9PA6V/AJMLZl1wb2fYKaxw/ExdZuLjrLQ6RCkX/dhZ8dhmupuYDTRvmcYtnf
 MofY3IqD71aApTzc1fPKqb7VOhJpwuaPCrvk0OXFPjyVOZp8k/svI0USqxKEOOcbv7zkTPrSbvz
 upRyk5H+GeBOG2qoGowvPxfB8a4ZhE3WExBLAALPlLEWWqDf34Jv3b8uHOspyuFdm7RDWN/rPpU
 oK161MeNkTbjEIoZzXmhH3P3N06axdG7eaywAw4YrOIYCLOoeY6Q4CVDn1I8U4TBb6EU/Fuam9Y
 aXP4CSYBsL8ziL76cYYA7O9c78b3fXdq2Xm0WPcJzNXnyqQBrTJyNjehjg+PGq90fQrfXjupVu2
 ZSFSGAQ758WLNzEe7/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX1sZs+pspUtdo
 pZAM/LAG5sxWucPJft6On23rlE6ur/HBOYcmEgM+J7lXFA631xt9P1gHQwJRCuvXGl6mMtKRjHQ
 YpSA5AVDNP5lGtPHnbDZRGQrnXB2bwY=
X-Proofpoint-GUID: tyTx9HcCkmRrsCYoUxb0FRtVFADdM7F-
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045c83 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EZJCw1MXRrN0MplZF-sA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_073219_861158_8D26571E 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/26 1:56 PM, Krishna Chaitanya Chundru wrote:
> Add support for MHI bandwidth scaling, which reduces power consumption
> if WLAN operates with lower bandwidth. This is only enabled for WCN7850.

Curiosity, not necessarily a blocker - do other ath12k chips also support
it?

Konrad

