Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZdqQ-0003uq-AR
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 17:42:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: PROBLEM: unable to get QCA6390 to work
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
Date: Mon, 02 Nov 2020 19:42:08 +0200
In-Reply-To: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com> (Pavel
 Procopiuc's message of "Mon, 2 Nov 2020 11:32:02 +0100")
Message-ID: <87lffjodu7.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Cc: ath11k@lists.infradead.org

Pavel Procopiuc <pavel.procopiuc@gmail.com> writes:

> Hi,
>
> I'm unable to get QCA6390 to work on kernel 5.10-rc2.
>
> I have a Dell XPS 17 laptop with the QCA6390 device and I'm trying to
> get it to work using 5.10-rc2 kernel. So far I'm getting firmware
> errors in the log. For the kernel setup and firmware files I was
> following the guide from
> https://www.spinics.net/lists/linux-wireless/msg203111.html.
>
> * The current firmware repo structure is a bit different so I'm using:
> QCA6390/hw2.0/board-2.bin -> /lib/firmware/ath11k/QCA6390/hw2.0/board.bin
> QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/amss.bin
> -> /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
> QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/m3.bin
> -> /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin

Can you do 'md5sum /lib/firmware/ath11k/QCA6390/hw2.0/*' and send the
output? Currently ath11k does not check the firmware files in any way
and I want to make sure they are not corrupted.

I have:

a101dc90f8e876f39383b60c9da64ec4  amss.bin
d4c912a3501a3694a3f460d13de06d28  m3.bin
4c0781f659d2b7d6bef10a2e3d457728  board-2.bin

Ah, now I noticed that you renamed board-2.bin to board.bin. But you
need to keep the file as board-2.bin, board-2.bin and board.bin are not
compatible. I need to send new instructions with the new board-2.bin
file.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
