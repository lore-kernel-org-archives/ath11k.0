Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6j4B-0004tk-Ul
 for ath11k@lists.infradead.org; Tue, 25 Feb 2020 22:52:41 +0000
Received: by mail-ua1-x943.google.com with SMTP id w15so287915uap.0
 for <ath11k@lists.infradead.org>; Tue, 25 Feb 2020 14:52:38 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id m80sm100607vka.26.2020.02.25.14.52.36
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 14:52:36 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id k188so560808vsc.8
 for <ath11k@lists.infradead.org>; Tue, 25 Feb 2020 14:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20200103045016.12459-1-wgong@codeaurora.org>
 <20200105.144704.221506192255563950.davem@davemloft.net>
In-Reply-To: <20200105.144704.221506192255563950.davem@davemloft.net>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2020 14:52:24 -0800
Message-ID: <CAD=FV=WiceRwLUS1sdL_W=ELKYZ9zKE13e8vx9SO0+tRvX74QQ@mail.gmail.com>
Subject: Re: [PATCH v2] net: qrtr: fix len of skb_put_padto in
 qrtr_node_enqueue
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, ath11k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, Wen Gong <wgong@codeaurora.org>

Hi,


On Sun, Jan 5, 2020 at 2:47 PM David Miller <davem@davemloft.net> wrote:
>
> From: Wen Gong <wgong@codeaurora.org>
> Date: Fri,  3 Jan 2020 12:50:16 +0800
>
> > The len used for skb_put_padto is wrong, it need to add len of hdr.
>
> Thanks, applied.

I noticed this patch is in mainline now as:

ce57785bf91b net: qrtr: fix len of skb_put_padto in qrtr_node_enqueue

Though I'm not an expert on the code, it feels like a stable candidate
unless someone objects.

-Doug

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
