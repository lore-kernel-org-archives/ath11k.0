Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6B6CA0FE7
	for <ath11k@archiver.kernel.org>; Tue, 26 Aug 2025 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwQL66e3Nu9k+2rWN9KxTqPiCmr+WouftcMZ22iOrnk=; b=1vOvwXfnb/Fn5H3b410PHdiR4m
	5Clq+eydsMuKi6YxBs618xhvWSLRaOsVrPoo1tgrL1CvsIKxDk1/mp3JMdhrd6kzEs7hRwGk6T8e7
	IppyNqwjREZ5CfVdWleS0Wq9P7jlBAAyPdoaXcHKtGwWZJXDF5ByLe3LKeXBRr2Ic2Nj5ScuS55T6
	nBeDHAh/bToSd2swfL37V5OkQM+P9w43PcYvOtA/4SPgn/+ASKlUcuk5k1EzXwLpFwYExcaCjxd+J
	sUf7QBYhJ3OVYGG8f81iJbtpt/wqdXrudef27RqCU6YwL1oDx5UZ88ihVl0nUk4D7RMVX+vydHCEy
	x/vbV5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvSB-0000000CQYD-3Y7f;
	Tue, 26 Aug 2025 15:19:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvS8-0000000CQWX-326y
	for ath11k@lists.infradead.org;
	Tue, 26 Aug 2025 15:19:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q9mDJ4024726
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 15:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwQL66e3Nu9k+2rWN9KxTqPiCmr+WouftcMZ22iOrnk=; b=eIgUxzswlkZHaCJj
	rnGJn/nm+urEM+YqiKmfCGzN9GianKouzNyZ4SMpX/5oHoXQBdOD92gtcvaJyGHJ
	HYcIwvtBb3wL+6ClPuis+8ZugT820zeUWhxaAf/J8MFqajlb0f8yyom/5qH5LcMG
	MPAUcLqG5oXx2rNdeim+dtqRMpnKQN3VNzUkXKaqRqHcyyoEQYQ32v2vAd5GIvcj
	I/rZmy9gjqo6fhYhEZZ7aPePWpgmlf8i9yjFrk4UWnkuiUfZKWJqX5k3ICVl6duZ
	fkRGBAvgp9w8u/ByXFJ3YR7qq/jxHiPjhtl5ldeR9VJji7FtqxQDrB7rFCfZIW9A
	ZrE4EQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5h5d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 15:19:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3274f7e6c1fso591372a91.0
        for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 08:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756221553; x=1756826353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwQL66e3Nu9k+2rWN9KxTqPiCmr+WouftcMZ22iOrnk=;
        b=ENTBySjpZe/p5b34jDf35sMosH/ydu2DCQ+QOIq/wrELiVV9d9yH+INTSZ1u+8wqIN
         SHY+UkSIIR60UpI8ehbFlX8hd6HVVdIRwgmKBlLG3+erw82TzE4Y5iR9rJ3S0eLyjGUW
         viy7jb+MkJOwc7BsnLAiwHwGuhmZ5z8jxkX171/F8hf9F71XprPJBZXBq8SkD1kfeCrn
         68Dw+wL6pfoKrC/BknD1VH2infMlE64dwhFisYSssGubQLYE4ExkBQz9ndcQCYtNKRFk
         RbfO9jJAb6bjPZe0YNW0r7DDIZxZoeycGVlUrjDwm9JOJhAMoMG8N3Bri/2pfdfkuoXK
         CZCw==
X-Forwarded-Encrypted: i=1; AJvYcCWBUpeaxJiRzQG3ct4JYlWHJBViK0rP2cILLdob8KHiNKCCRc+jfL3G5bscT3wKugYcU/Xk3wg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyry/Cj9d4Wu8D7rsSCoi1O649m0Ul13qKUt4N6wBbtucpM/bgC
	erJlGUK0/XwVPEHK0iLQDyfvnvbxRRMM+Z6jz3W2+Ad5f1SbGMj1gpiR5P/RN390bAX7F8gQL6C
	SwaJmS2VQLi4Ee8K3Op5vcNV1mPrSAcY5FeesgpKbOHbMYJLkRr0sT6asj+RbbW7j
X-Gm-Gg: ASbGnct0vEC79Vm2XEn913oMOAC1nXREPWB9YN+JoP/18p7m37VzZ9QcYSkWh8gdNYB
	B4/FdTkMNgazO8NJWcIUk5h2rFbDFroyWOD2EekL6Hnpv2OUJN5Ha3xn7p9YP5skYa3GHHccMr+
	GUovGx73occtjMHRBpe3Awoq/lOEEjmQhETBtEnJccLjKQKYapuYJ8aB5YK4trPzPHY4y7x2M77
	j2TlAvVPUuKwUVsEzt+zm+a9ZasCVTow+CXWYaeAXRhJ/v2jZ5wtwpFOeSdMAd/UuLXjmytbNkb
	n2Um0ke2Kw72LXgkBIka7t3HVa1Gj8feLPKcf8IoKiyC57MpdGRCYq/Wbpbu6m3mnrrkTzzO7mW
	O+GVTISChs/Rfp8ZihRY=
X-Received: by 2002:a17:90b:39cf:b0:325:17e1:ab69 with SMTP id 98e67ed59e1d1-32517e1b5a7mr19762798a91.3.1756221553058;
        Tue, 26 Aug 2025 08:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBFCqB9ocm/fFjwbsOzFsZHFiZH3GbPHYwnLpzF4CEcjFDhaSfsGGNUpwdAdtaM5f+IRrboQ==
X-Received: by 2002:a17:90b:39cf:b0:325:17e1:ab69 with SMTP id 98e67ed59e1d1-32517e1b5a7mr19762764a91.3.1756221552537;
        Tue, 26 Aug 2025 08:19:12 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa708cdsm10154132a91.26.2025.08.26.08.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 08:19:12 -0700 (PDT)
Message-ID: <0993bd25-3cab-4f96-9398-bf5b5f7770cd@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 08:19:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] PCI/ASPM: Return enabled ASPM states from
 pcie_aspm_enabled() API
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-5-61b2f2db7d89@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825-ath-aspm-fix-v2-5-61b2f2db7d89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyGQgHnOnsFvV
 r6ZR9kICNO+8JwwJL5Z4zl8lVfitu4Tszk6lZPwco+3DtBUNbQFozkuIQ+tRkcWYPq2urqJ+VNe
 9tpf3b2e9GTJOUYanl0PhL9gZFNZ62kC0B3FLYGaSpNdQbMuCmVq4l9Oak8sE1mPe7yZQkRVzkm
 G0hP3HNmpAzb7A48M6HHrPOkFidh9Jlm7chodAjj57UKTWIhhQL9TNNAm0CdAmmb6XujLsHZ6jm
 oemyG9UwtpOKbLWGDjQHBDK7jJgmh36w2cBX3BGao+8vfUJPgQyjmpmAILQia08gBJtOaXVYBAL
 Tf4mvH4m9tLQnWE8c8EYqoes7bkalorBJPyZvayhBlWYhTv8GzXIVxXMFZyed2RZEJAnilvsGlC
 R0s/4AJa
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68add072 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=guytT1_IP8q0_Fb2ReoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 9t-wuKNn7VenLW1IaOLW7NUc7zIAYGqS
X-Proofpoint-ORIG-GUID: 9t-wuKNn7VenLW1IaOLW7NUc7zIAYGqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_081916_880494_D0E7A77C 
X-CRM114-Status: UNSURE (   9.67  )
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

On 8/25/2025 10:44 AM, Manivannan Sadhasivam via B4 Relay wrote:
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1851,7 +1851,7 @@ int pci_enable_link_state(struct pci_dev *pdev, int state);
>  int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
>  void pcie_no_aspm(void);
>  bool pcie_aspm_support_enabled(void);
> -bool pcie_aspm_enabled(struct pci_dev *pdev);
> +u32 pcie_aspm_enabled(struct pci_dev *pdev);
>  #else
>  static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
>  { return 0; }
> @@ -1863,7 +1863,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
>  { return 0; }
>  static inline void pcie_no_aspm(void) { }
>  static inline bool pcie_aspm_support_enabled(void) { return false; }
> -static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
> +static inline u32 pcie_aspm_enabled(struct pci_dev *pdev) { return false; }

return 0?

>  #endif
>  
>  #ifdef CONFIG_HOTPLUG_PCI
> 


